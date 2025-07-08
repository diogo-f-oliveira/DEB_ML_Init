  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_lavaretus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_lavaretus'; 
metaData.species_en = 'European whitefish'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2017 08 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 19]; 

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'Tolo1997';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 73;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1.5 mm of Coregonus_albula: 4/3*pi*0.075^3';
data.Wwi = 1e4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
    
data.GSI = 0.16; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'SzczSzcz2010';
  temp.GSI = C2K(8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
1.084	13.400
2.109	14.485
3.086	15.461
4.112	17.523
5.090	20.344
6.066	21.103
7.042	21.754
8.043	23.056
9.044	23.599
10.021	25.497
11.048	28.861
11.973	27.288];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Tolo1997';
comment.tL = 'max surface temp is 13.9 C, ice in winter';

% time-weight
data.tW = [ ... % time (yr), wet weight (g)
0.953	12.355
1.989	18.147
2.976	20.463
4.012	30.888
5.001	47.876
6.013	53.282
7.000	57.529
8.014	78.764
8.977	78.764
9.991	110.811
10.960	160.618
11.995	158.687];
data.tW(:,1) = 365 * (.5 + data.tW(:,1));
units.tW = {'d', 'cm'}; label.tW = {'time', 'wet weight'};  
temp.tW = C2K(8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Tolo1997';
comment.tW = 'max surface temp is 13.9 C, ice in winter';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Time since birth at time zero is introduced as parameter to accomodate large length at zero';
metaData.discussion = struct('D1', D1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6B298'; % Cat of Life
metaData.links.id_ITIS = '161950'; % ITIS
metaData.links.id_EoL = '46563166'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_lavaretus'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_lavaretus'; % ADW
metaData.links.id_Taxo = '42846'; % Taxonomicon
metaData.links.id_WoRMS = '127180'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-lavaretus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_lavaretus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tolo1997'; type = 'Article'; bib = [ ...  
'author = {A. Tolonen}, ' ...
'year = {1997}, ' ...
'title = {Size-specific food selection and growth in benthic whitefish, \emph{Coregonus lavaretus} ({L}.), in a subarctic lake}, ' ... 
'journal = {Boreal Environment Research}, ' ...
'pages = {387-399}, ' ...
'volume = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SzczSzcz2010'; type = 'Article'; bib = [ ...  
'author = {M. Szczepkowski and B. Szczepkowska and T. Krzywosz and K. Wunderlich and R. Stabinsk}, ' ...
'year = {2010}, ' ...
'title = {Growth rate and reproduction of a brood stock of {E}uropean whitefish (\emph{Coregonus lavaretus} {L}.) from {L}ake {G}aladus under controlled rearing conditions}, ' ... 
'journal = {Arch. Pol. Fish.}, ' ...
'pages = {3--11}, ' ...
'volume = {18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/232}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_artedi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_artedi'; 
metaData.species_en = 'Cisco'; 

metaData.ecoCode.climate = {'MC', 'ME', 'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'MAN','THn'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 15]; 

%% set data
% zero-variate data
data.am = 13*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'ADW';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'StocEben2009'; 
  comment.Lp = '28 to 34 cm';
data.Li = 57;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.9e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'StocEben2009';
  comment.Wwb = 'based on egg diameter of 1.95 mm: pi/6*0.195^3';
data.Wwp = 145.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'StocEben2009','fishbase'};
  comment.Wwp = 'based on 0.00575*Lp^3.15, see F1';
data.Wwi = 1.95e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00575*Li^3.15, see F1; ADW reports 3.4 kg';
    
data.Ri = 24549/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (d), total length (cm)
2.016	23.706
2.016	24.049
2.062	24.873
2.084	24.529
3.025	26.314
3.025	26.520
3.050	27.755
3.050	28.167
3.990	29.471
4.036	30.157
4.038	31.461
4.104	30.775
5.044	31.804
5.046	33.108
5.047	33.725
6.009	34.686
6.030	33.794
6.050	32.833
6.051	33.451
6.078	36.333
7.035	34.137
7.036	34.618
7.037	35.441
7.999	36.196
8.018	34.069
8.018	34.412
8.021	35.922
9.026	36.127
9.026	36.539
9.028	37.431
9.069	35.235
10.057	38.804
10.058	39.422
10.075	35.922
10.078	37.500
11.018	38.941
11.059	36.814
11.061	38.049
11.081	36.196
12.027	41.618
12.043	37.569
12.045	38.873
13.007	39.971
13.073	39.284
13.094	38.667
13.100	41.961
14.032	38.735
14.037	41.686
14.052	36.676
14.076	38.118
16.072	43.196];
data.tL(:,1) = 365 * (1.95 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StocEben2009';
comment.tL = 'Data from Lake Superior';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Temperature is guessed at the preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.15'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'YD85'; % Cat of Life
metaData.links.id_ITIS = '623384'; % ITIS
metaData.links.id_EoL = '46563171'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_artedi'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_artedi'; % ADW
metaData.links.id_Taxo = '96358'; % Taxonomicon
metaData.links.id_WoRMS = '158725'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-artedi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_artedi}}';  
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
bibkey = 'StocEben2009'; type = 'Article'; bib = [ ... 
'doi = {10.1577/M08-002.1}, ' ...
'author = {Jason D. Stockwell and Mark P. Ebener and Jeff A. Black and Owen T. Gorman and Thomas R. Hrabik and ronald E. Kinnunen and William P. Mattes and Jason K. Oyadomari and Stephen T. Schram and D. R. Schreiner and Shawn P. Sitar and Daniel L. Yule}, ' ...
'year = {2009}, ' ...
'title = {A Synthesis of Cisco Recovery in {L}ake {S}uperior: {I}mplications for Native Fish Rehabilitation in the {L}aurentian {G}reat {L}akes}, ' ... 
'journal = {North American Journal of Fisheries Management}, ' ...
'pages = {626-652}, ' ...
'volume = {29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coregonus-artedi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_artedi/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


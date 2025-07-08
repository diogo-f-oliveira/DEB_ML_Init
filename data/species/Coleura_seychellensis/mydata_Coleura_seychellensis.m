function [data, auxData, metaData, txtData, weights] = mydata_Coleura_seychellensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Emballonuridae';
metaData.species    = 'Coleura_seychellensis'; 
metaData.species_en = 'Seychelles sheath-tailed bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 26]; 

%% set data
% zero-variate data

data.tg = 90;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ADW gives 8-10 mnth, but also that Wwb = 2.1 g';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Gerl2009';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 650;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.38; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'Gerl2009';
  comment.Wwb = 'based on l_b^3*Wwi= 10.5/27';
data.Wwi = 10.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '10-11 g';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tL = [ ... % time since birth (d), fraction of adult size (-)
0.893	0.348
2.046	0.445
2.947	0.532
9.051	0.749
10.059	0.810
11.131	0.777
15.077	0.867
16.118	0.899
19.054	0.880
20.058	0.893
21.099	0.933
22.139	0.944];
units.tL   = {'d', '-'};  label.tL = {'time since birth', 'fraction of mother size'};  
temp.tL    = C2K(34.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gerl2009';
comment.tL = 'Data from photo''s of mother with young, and represent size of young as fraction of that of mother';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Body temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'X22B'; % Cat of Life
metaData.links.id_ITIS = '631699'; % ITIS
metaData.links.id_EoL = '328782'; % Ency of Life
metaData.links.id_Wiki = 'Coleura_seychellensis'; % Wikipedia
metaData.links.id_ADW = 'Coleura_seychellensis'; % ADW
metaData.links.id_Taxo = '63978'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800977'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coleura_seychellensis}}';
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
bibkey = 'Gerl2009'; type = 'Article'; bib = [ ... 
'doi = {10.3354/esr00151}, ' ...
'author = {Justin Gerlach}, ' ... 
'year = {2009}, ' ...
'title = {Conservation of the {S}eychelles sheath-tailed bat \emph{Coleura seychellensis} on {S}ilhouette {I}sland, {S}eychelles}, ' ...
'journal = {Endang Species Res}, ' ...
'volume = {8}, ' ...
'pages = {5–13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


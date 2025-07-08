function [data, auxData, metaData, txtData, weights] = mydata_Cervus_canadensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Cervus_canadensis'; 
metaData.species_en = 'Wapiti'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 01 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2017 11 13];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 251;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'Wiki';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '240-262 d';
data.tx = 61;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'Wiki';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 15500;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwp = 200e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
data.Wwi = 233e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '225 till 241 kg';
data.Wwim = 280e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Bend2011';
  comment.Wwim = 'Wiki:320 till 331 kg';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = {'Wiki'};   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'If food is abundant, 2 calves are possible but rare';

% uni-variate data
% time-weight
data.tW_m = [ % time since birth (yr), weight (kg)
0.467	93.572
1.451	147.153
2.470	186.748
3.478	217.955
4.463	243.013
5.471	260.797
6.562	270.742
7.501	279.027
8.487	275.001
9.497	274.329]; 
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight'};  
temp.tW_m  = C2K(38.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Bend2011';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = 10 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} only';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '5GCN2'; % Cat of Life
metaData.links.id_ITIS = '898259'; % ITIS
metaData.links.id_EoL = '4446367'; % Ency of Life
metaData.links.id_Wiki = 'Cervus_elaphus_canadensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '93700'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200352'; % MSW3
metaData.links.id_AnAge = 'Cervus_elaphus_canadensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cervus_canadensis}}';
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
bibkey = 'Bend2011'; type = 'report'; bib = [ ... 
'author = {L. C. Bender}, ' ... 
'year = {2011}, ' ...
'title = {Basics of Trophy Management}, ' ...
'institution = {New Mexico state university}, ' ...
'volume = {Guide L-111}, ' ...
'howpublished = {http://aces.nmsu.edu/pubs/_l/L111.pdf}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Micropteropus_pusillus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Micropteropus_pusillus'; 
metaData.species_en = 'Peters'' dwarf epauletted fruit bat'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiHn', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 11 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 06]; 

%% set data
% zero-variate data

data.tg = 6*30.5;    units.tg = 'd';    label.tg = 'gestation time';            bibkey.tg = 'guess';   
  temp.tg = C2K(34.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on tp, while giving birth at 365 d';
data.tx = 50;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Eidolon_helvum, corrected for bosy size difference';
data.tp = 6*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty female'; bibkey.tp = 'Thom1984';
  temp.tp = C2K(34.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7*30.5;    units.tpm = 'd';    label.tpm = 'time since birth at puberty female'; bibkey.tpm = 'Thom1984';
  temp.tpm = C2K(34.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 21.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Eidolon_helvum';

data.Wwb = 15.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Thom1984';
  comment.Wwb  = 'based on extrapolation of tW data';
data.Wwi = 35;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Thom1984';
data.Wwim = 35; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Thom1984';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Thom1984';   
  temp.Ri = C2K(34.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litter per yr';

% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
28.616	20.000
31.570	17.612
38.836	20.746
46.115	24.478
48.519	24.627
51.506	23.881
51.521	24.627
55.687	22.836
59.328	24.776
64.662	21.343
68.886	22.388
70.128	24.478
70.143	25.224
74.285	22.239
86.961	25.672
133.231	27.910];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f   = C2K(34.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Thom1984';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
22.882	20.250
22.921	22.200
24.049	18.600
27.687	20.400
27.702	21.150
37.310	21.300
39.084	19.950
41.008	26.100
45.712	21.150
57.214	25.950
62.542	22.200
63.815	25.800
64.917	20.850
66.772	23.550
82.428	25.950
93.243	26.400
104.655	26.700
107.684	28.050
124.508	28.800
147.882	26.850];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m   = C2K(34.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Thom1984';
comment.tW_m = 'Data for males; indivuduals > 27 g omitted, since their age is uncertain';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;

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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males tend to be smaller than females';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7TKHN'; % Cat of Life
metaData.links.id_ITIS = '631589'; % ITIS
metaData.links.id_EoL = '289597'; % Ency of Life
metaData.links.id_Wiki = 'Micropteropus_pusillus'; % Wikipedia
metaData.links.id_ADW = 'Micropteropus_pusillus'; % ADW
metaData.links.id_Taxo = '63783'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800174'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropteropus_pusillus}}';
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
bibkey = 'Thom1984'; type = 'Article'; bib = [ ... 
'author = {D. W. Thomas}, ' ... 
'year = {1984}, ' ...
'title = {Reproduction and growth in three species of {W}est {A}frican fruit bats}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {202}, ' ...
'pages = {265-281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Micropteropus_pusillus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


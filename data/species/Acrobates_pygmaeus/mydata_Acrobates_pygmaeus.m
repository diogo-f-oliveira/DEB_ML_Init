function [data, auxData, metaData, txtData, weights] = mydata_Acrobates_pygmaeus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Acrobatidae';
metaData.species    = 'Acrobates_pygmaeus'; 
metaData.species_en = 'Feathertail glider'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 65;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'animalia';   
  temp.tg = C2K(34.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '65-100 d';
data.tx = 99;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(34.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8.8*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(34.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.0178; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 5.65; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 13; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 2*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 litters per yr; 3 pups per litter';

% univariate data

% time-weight
data.tWw_f = [ ... % time since eye opening (d), weight (g)
-0.047	2.899
14.160	4.697
21.639	4.933
25.847	6.561
35.752	7.234
39.572	8.258
46.868	9.467
54.927	9.284
60.864	9.721
69.841	9.992
76.264	10.513
94.783	10.718
118.305	10.991
144.925	10.796];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since eye opening', 'weight', 'female'};  
temp.tWw_f  = C2K(34.7);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'FannWatk1980';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
0.000	3.385
8.280	3.539
13.353	4.713
22.149	5.218
26.647	6.610
36.405	7.216
40.991	8.356
47.840	8.727
55.826	8.696
62.118	9.234
69.138	10.543
74.515	10.846
83.410	11.067
103.347	12.497
117.766	12.602
144.215	12.509];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'weight', 'male'};  
temp.tWw_m  = C2K(34.7);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'FannWatk1980';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;
weights.Wwx = 0 * weights.Wwx;

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Discussion points
D1 = 'Time-weight data point for varying food(milk) availabily';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '9KW2'; % Cat of Life
metaData.links.id_ITIS = '609845'; % ITIS
metaData.links.id_EoL = '129546'; % Ency of Life
metaData.links.id_Wiki = 'Acrobates_pygmaeus'; % Wikipedia
metaData.links.id_ADW = 'Acrobates_pygmaeus'; % ADW
metaData.links.id_Taxo = '60182'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000169'; % MSW3
metaData.links.id_AnAge = 'Acrobates_pygmaeus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acrobates_pygmaeus}}';
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
bibkey = 'FannWatk1980'; type = 'Article'; bib = [ ... 
'author = {Fanning, F. D. and K. Watkins}, ' ... 
'year = {1980}, ' ...
'title = {Growth and development in \emph{Acrobates pygmaeus} ({B}urramyidae: {M}arsupialia)}, ' ...
'journal = {Australian Mammology}, ' ...
'volume = {3}, ' ...
'pages = {57-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Acrobates_pygmaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'animalia'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animalia.bio/feathertail-glider}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


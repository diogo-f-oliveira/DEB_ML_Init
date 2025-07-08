function [data, auxData, metaData, txtData, weights] = mydata_Natrix_natrix

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Natrix_natrix'; 
metaData.species_en = 'Grass snake'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0bTg', 'biFm'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 70;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4.5*365;   units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'Mads1983';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.apm = 3*365;    units.apm = 'd';    label.apm = 'age at puberty';  bibkey.apm = 'Mads1983';
  temp.apm = C2K(18); units.temp.apm = 'K'; label.temp.apm = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 19;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'Mads1983';  
data.Lbm = 20;    units.Lbm  = 'cm';  label.Lbm  = 'total length at hatching for males';      bibkey.Lbm  = 'Mads1983';  
data.Lp  = 68;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';      bibkey.Lp  = 'Mads1983';  
data.Lpm = 55;    units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';      bibkey.Lpm  = 'Mads1983';  
data.Li  = 190;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 50;    units.Lim = 'cm';  label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 3;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'Mads1983';
data.Wwi = 850;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'Wiki give 240 g, but this is probably not for a 240 cm individual';
  
data.Ri  = 40/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total (cm)
0.009	19.283
1.322	46.778
2.320	56.425
3.327	67.538
4.315	77.184
5.304	84.879
6.322	90.382
7.300	95.393
8.299	98.455];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mads1983';
comment.tL_f = 'Data for females; Temp is guessed';
% males
data.tL_m = [ ... % time since birth (yr), total (cm)
0.009	20.259
1.322	44.583
3.318	61.927
4.326	64.746
5.315	70.246
6.304	73.307
7.302	74.174
8.311	74.310];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mads1983';
comment.tL_m = 'Data for males; Temp is guessed';

% length-fecundity
data.LN = [ ... % total length (cm), clucht size (#)
68.323	8.993
70.397	9.845
71.117	8.957
71.309	6.008
72.256	8.919
74.213	6.983
74.311	5.932
75.279	12.964
76.081	7.915
78.157	8.928
80.848	8.892
85.201	9.950
92.173	16.830
93.420	17.882
95.295	19.986
99.549	21.892];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Mads1983';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hb and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Males raise body temp after hibernation to boost sperm production';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '745RJ'; % Cat of Life
metaData.links.id_ITIS = '700799'; % ITIS
metaData.links.id_EoL = '791395'; % Ency of Life
metaData.links.id_Wiki = 'Natrix_natrix'; % Wikipedia
metaData.links.id_ADW = 'Natrix_natrix'; % ADW
metaData.links.id_Taxo = '50029'; % Taxonomicon
metaData.links.id_WoRMS = '1498233'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Natrix&species=natrix'; % ReptileDB
metaData.links.id_AnAge = 'Natrix_natrix'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Natrix_natrix}}';
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
bibkey = 'Mads1983'; type = 'Article'; bib = [ ... 
'author = {T. Madsen}, ' ... 
'year = {1983}, ' ...
'title = {Growth Rates, Maturation and Sexual Size Dimorphism in a Population of Grass Snakes, \emph{Natrix natrix}, in {S}outhern {S}weden}, ' ...
'journal = {Oikos}, ' ...
'volume = {40}, ' ...
'pages = {277--282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Natrix_natrix}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

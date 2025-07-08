function [data, auxData, metaData, txtData, weights] = mydata_Sistrurus_miliarius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Sistrurus_miliarius'; 
metaData.species_en = 'Pygmy rattlesnake'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 11];

%% set data
% zero-variate data

data.ab = 4*30.5;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'ADW';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16.1*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';      bibkey.Lp  = {'ADW','MayFarr2012'};
  comment.Lp = 'based on tp = 2 yr, and tL data';
data.Lpm  = 35;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';      bibkey.Lpm  = {'ADW','MayFarr2012'};  
  comment.Lpm = 'based on tp = 2 yr, and tL data';
data.Li  = 49;    units.Li  = 'cm';  label.Li  = 'ultimate SVL of females';  bibkey.Li  = 'MayFarr2012';
data.Lim  = 49;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL of males';  bibkey.Lim  = 'MayFarr2012';

data.Wwb = 3.5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'ADW';
  comment.Wwb = '1.8 to 5 g';
  
data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 12 young per clutch, 1 clutch per yr assumed';

% univariate data

% time-length data
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.000	15.986
0.453	21.386
0.923	28.533
1.385	31.438
1.846	33.511
2.308	37.580
2.769	38.572
3.231	40.479
3.701	41.970
4.154	42.130
4.632	44.452
5.085	44.196
5.547	46.269
6.008	46.429];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MayFarr2012';
comment.tL_f = 'Data for females in Volusia County, Florida,';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.000	16.402
0.462	22.717
0.923	27.951
1.385	31.272
1.854	33.927
2.299	36.915
2.777	37.823
3.223	41.477
3.684	40.473
4.170	42.462
4.615	42.040
5.069	43.115
5.538	45.438
6.008	48.176];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MayFarr2012';
comment.tL_m = 'Data for males in Volusia County, Florida,';

% time-weight data
data.tW_f = [ ... % time since birth (yr), weight (g)
0.000	4.706
0.479	11.529
0.916	23.529
1.387	26.824
1.857	32.941
2.311	43.765
2.765	50.118
3.235	52.706
3.706	58.588
4.160	56.235
4.613	69.412
5.084	66.824
5.546	89.647
6.025	68.941];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MayFarr2012';
comment.tW_f = 'Data for females in Volusia County, Florida,';
%
data.tW_m = [ ... % time since birth (yr), weight (g)
0.000	4.706
0.462	13.176
0.924	21.647
1.387	28.235
1.857	34.588
1.866	82.588
2.303	44.000
2.773	45.176
3.252	55.529
3.706	56.000
4.168	42.588
4.639	60.941
5.109	65.882
5.555	75.059
6.025	98.353];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MayFarr2012';
comment.tW_m = 'Data for males in Volusia County, Florida,';

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Sex is determined by incubation temperature';
metaData.bibkey.F1 = 'retileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XRS4'; % Cat of Life
metaData.links.id_ITIS = '174302'; % ITIS
metaData.links.id_EoL = '790628'; % Ency of Life
metaData.links.id_Wiki = 'Sistrurus_miliarius'; % Wikipedia
metaData.links.id_ADW = 'Sistrurus_miliarius'; % ADW
metaData.links.id_Taxo = '93130'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sistrurus&species=miliarius'; % ReptileDB
metaData.links.id_AnAge = 'Sistrurus_miliarius'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sistrurus_miliarius}}';
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
bibkey = 'MayFarr2012'; type = 'Article'; bib = [ ... 
'doi = {10.1655/HERPMONOGRAPHS-D-11-00003.1}, ' ...
'author = {Peter G. May and Terence M. Farrell}, ' ... 
'year = {2012}, ' ...
'title = {Growth Patterns of Dusky Pygmy Rattlesnakes (\emph{Sistrurus miliarius barbouri}) from {C}entral {F}lorida}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {26}, ' ...
'pages = {58-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sistrurus_miliarius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Sistrurus_miliarius/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/genus=Sistrurus&species=miliarius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


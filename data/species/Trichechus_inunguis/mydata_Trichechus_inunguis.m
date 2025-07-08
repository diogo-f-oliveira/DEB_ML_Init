function [data, auxData, metaData, txtData, weights] = mydata_Trichechus_inunguis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Sirenia'; 
metaData.family     = 'Trichechidae';
metaData.species    = 'Trichechus_inunguis'; 
metaData.species_en = 'Amazon manatee'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 13*30.5; units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from sirenian; value for florida manatee';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'seaworld';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for florida manatee, mostly 7-9 yr';
data.am = 60*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'VergPare2010';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'for florida manatee';

data.Lb  = 90;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'seaworld';
data.Li  = 290;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'VergPare2010';
data.Lim = 282;    units.Lim = 'cm';  label.Lim = 'ultimate total length for males';   bibkey.Lim  = 'VergPare2010';

data.Wwb = 12.5e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'spec_id';
data.Wwi = 450e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'VergPare2010';

data.Ri  = 0.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'seaworld';   
  temp.Ri = C2K(36.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (kg)
0.100	124.540
0.976	162.577
1.922	177.301
3.070	260.123
4.059	185.890
5.018	268.098
6.078	228.834
6.955	217.178
8.090	239.264
9.093	226.994
11.983	232.515
13.048	216.564
13.996	242.945
15.067	261.350
18.078	239.877
21.102	282.822
36.114	281.595];
data.tW_f(:,1) = 365 * (0.5 + data.tW_f(:,1)); % convert yr to d
data.tW_f(:,2) = 1e3 * data.tW_f(:,2); % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(36.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'VergPare2010';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (kg)
0.130	111.492
1.133	165.827
1.922	162.298
3.210	177.823
4.899	217.339
6.967	196.875
7.960	216.633
9.150	234.274
9.938	230.040
12.119	258.972
12.898	222.984
14.093	258.972
14.972	224.395
17.062	280.847
22.986	281.552
28.985	198.992];
data.tW_m(:,1) = 365 * (0.5 + data.tW_m(:,1)); % convert yr to d
data.tW_m(:,2) = 1e3 * data.tW_m(:,2); % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(36.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'VergPare2010';
comment.tW_m = 'Data for males';

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'constant replacement of molar teeth, unique among mammals';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58862'; % Cat of Life
metaData.links.id_ITIS = '180686'; % ITIS
metaData.links.id_EoL = '46559225'; % Ency of Life
metaData.links.id_Wiki = 'Trichechus_inunguis'; % Wikipedia
metaData.links.id_ADW = 'Trichechus_inunguis'; % ADW
metaData.links.id_Taxo = '69439'; % Taxonomicon
metaData.links.id_WoRMS = '255026'; % WoRMS
metaData.links.id_MSW3 = '11600011'; % MSW3
metaData.links.id_AnAge = 'Trichechus_inunguis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trichechus_inunguis}}';
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
bibkey = 'VergPare2010'; type = 'Article'; bib = [ ... 
'author = {Vergara-Parente, J. E. and Parente, C. L. and Marmontel, M. and Silva, J. C. R. and S\''{a}, F. B.}, ' ... 
'year = {2010}, ' ...
'title = {Growth curve of free-ranging \emph{Trichechus inunguis}}, ' ...
'journal = {Biota Neotrop.}, ' ...
'volume = {10}, ' ...
'number = {3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Trichechus_inunguis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ISSN'; type = 'Misc'; bib = [ ...
'author = {ISSN 1676-0603}, ' ... 
'howpublished = {\url{http://www.biotaneotropica.org.br/v10n3/en/abstract?article+bn01410032010}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seaworld'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seaworld.org/animal-info/info-books/manatee/birth-&-care.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sirenian'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sirenian.org/FPLBooklet.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'spec_id'; type = 'Misc'; bib = ...
'howpublished = {\url{http://species-identification.org/species.php?species_group=marine_mammals&id=150}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


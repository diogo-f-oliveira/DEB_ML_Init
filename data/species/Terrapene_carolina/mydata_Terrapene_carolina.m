function [data, auxData, metaData, txtData, weights] = mydata_Terrapene_carolina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Terrapene_carolina'; 
metaData.species_en = 'Common box turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 31];              
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

data.ab = 75;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Wiki';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '70 to 80 d';
data.tp = 5.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ErnsWilg1998';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '12 to 14 yr';
data.am = 138*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.2;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';   bibkey.Lb  = 'ErnsWilg1998'; 
data.Lp  = 9.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'ErnsWilg1998'; 
data.Li  = 12.6;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'ErnsWilg1998';
data.Lim  = 14.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'ErnsWilg1998';

data.Wwi = 1232.64; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'EoL';
  comment.Wwi = 'based on size-corrected value for Actinemys marmorata: (22/16)^3*626';

data.Ri  = 4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 8 eggs per clutch, 1 clutch per yr';
 
% uni-variate data

% time-length data
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.942	2.996
0.942	3.473
2.915	7.350
3.049	7.100
5.022	8.254
9.103	11.765
10.000	11.423
12.108	12.940
12.152	11.284
13.094	11.577
14.126	12.778
15.022	12.233
15.112	13.322
16.099	12.299
16.188	13.842
17.130	10.891
17.220	12.910
18.117	11.615
19.148	12.930
20.045	13.473
20.090	13.223
20.135	12.497];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ErnsWilg1998';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
5.964	9.660
10.135	10.470
12.063	14.143
12.064	14.007
12.065	10.989
12.960	13.756
13.004	15.163
13.094	12.031
13.139	14.187
13.946	13.459
14.081	15.343
15.022	12.119
15.022	12.981
15.112	13.594
16.054	11.754
17.040	14.703
17.085	13.886
17.130	12.592
17.982	12.069
17.983	15.495
18.072	13.499
21.031	14.334
23.004	13.491
23.094	14.762
25.157	15.893
26.951	13.531];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ErnsWilg1998';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Males ar born at T = 22 - 27 C, females if T > 28';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '55HWJ'; % Cat of Life
metaData.links.id_ITIS = '173776'; % ITIS
metaData.links.id_EoL = '1055222'; % Ency of Life
metaData.links.id_Wiki = 'Terrapene_carolina'; % Wikipedia
metaData.links.id_ADW = 'Terrapene_carolina'; % ADW
metaData.links.id_Taxo = '48641'; % Taxonomicon
metaData.links.id_WoRMS = '1506580'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Terrapene&species=carolina'; % ReptileDB
metaData.links.id_AnAge = 'Terrapene_carolina'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Terrapene_carolina}}';
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
bibkey = 'ErnsWilg1998'; type = 'Article'; bib = [ ... 
'author = {Carl H. Ernst and James C. Wilgenbusch and Timothy P. Boucher and Steven W. Sekscienski}, ' ... 
'year = {1998}, ' ...
'title = {GROWTH, ALLOMETRY AND SEXUAL DIMORPHISM IN THE {F}LORIDA BOX TURTLE, \emph{Terrapene carolina} {B}AURI}, ' ...
'journal = {Herpedological Journal}, ' ...
'volume = {8}, ' ...
'pages = {72-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Terrapene_carolina/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Terrapene_carolina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055222}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


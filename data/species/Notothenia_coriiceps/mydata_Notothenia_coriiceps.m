function [data, auxData, metaData, txtData, weights] = mydata_Notothenia_coriiceps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Notothenia_coriiceps'; 
metaData.species_en = 'Black rockcod'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};
metaData.date_subm = [2017 04 13]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 365/2;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'PostYan2016';   
  temp.ab = C2K(-1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CaliRigi2017';   
  temp.am = C2K(-1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 39; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'CaliRigi2017'; 
data.Lpm = 36; units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'CaliRigi2017'; 
data.Li  = 62; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 3.3e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'WhitVeit1996';
  comment.Wwb = 'based egg diameter of 4.1 mm: 4/3*pi*0.2^3'; 
data.Wwp = 907; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'CaliRigi2017';
  comment.Wwp = 'based on 0.0085 * Lp^3.1602, see F1';
data.Wwpm = 704; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'CaliRigi2017';
  comment.Wwpm = 'based on 0.0085 * Lpm^3.1602, see F1';
data.Wwi = 3924; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0085 * Li^3.1602, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
 5 25.9
 6 28.9
 7 30.3
 8 32.4
 9 34.0
10 36.6
11 37.8
12 38.0];
data.tL_f(:,1) = 365 * (3.5 + data.tL_f(:,1));  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(-1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LinkZuko1980';
comment.tL_f = 'data for females; 3.5 yr has been added to transform time to time since birth';
% 
data.tL_m = [ ... % time since birth (yr), total length (cm)
 4 19.3
 5 20.9
 6 24.5
 7 26.6
 8 28.9
 9 31.1
10 32.6
11 33.9
12 33.2];
data.tL_m(:,1) = 365 * (3.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(-1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LinkZuko1980';
comment.tL_m = 'data for males; 3.5 yr has been added to transform time to time since birth';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
26.084	298.824
26.649	334.734
33.930	765.711
36.546	631.615
38.878	990.316
39.868	1080.041
40.716	1286.235
41.423	1169.832
41.423	1259.438
41.565	1349.060
42.130	1268.483
43.544	1582.272
44.039	1671.936
44.109	1582.339
44.109	1537.536
44.604	1528.635
44.887	1465.945
44.958	1618.283
45.028	1734.779
45.594	1492.911
45.806	1582.542
45.947	1663.204
45.947	1869.297
46.866	1869.407
47.008	1672.291
47.432	2093.489
48.845	2487.923
48.987	1941.345
48.987	2192.241
49.976	2138.596
50.047	2317.816
50.471	2120.734
50.825	2515.041
51.814	2551.002
53.440	2336.142
53.723	2757.323
53.794	2837.977
55.419	2882.974];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'CaliRigi2017';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
38.881	8445.814
39.833	15460.124
40.558	14744.379
40.811	13312.890
41.511	22903.886
43.359	18466.260
43.838	24907.978
44.418	23190.186
44.488	20613.498
44.855	24764.829
44.885	18752.560
44.962	22760.736
45.258	28200.410
45.840	28773.009
45.907	23476.485
46.273	25910.023
48.893	29775.054
48.900	36789.367
48.906	42372.190
49.767	32065.441
49.878	34355.829
50.461	35644.173
50.929	31492.842
50.987	52249.490
51.999	47096.116
53.443	39079.755
53.957	44233.129
55.414	47668.713];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(-1);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CaliRigi2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 2 * weights.psd.kap;
weights.psd.p_M = 2 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'weight-length relationship: W = 0.0085 * TL^3.1602';
metaData.bibkey.F1 = 'LinkZuko1980'; 
F2 = 'Marine; demersal; depth range 0 - 550 m. Polar, preferred -1 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '74DCN'; % Cat of Life
metaData.links.id_ITIS = '642592'; % ITIS
metaData.links.id_EoL = '46572973'; % Ency of Life
metaData.links.id_Wiki = 'Notothenia_coriiceps'; % Wikipedia
metaData.links.id_ADW = 'Notothenia_coriiceps'; % ADW
metaData.links.id_Taxo = '181460'; % Taxonomicon
metaData.links.id_WoRMS = '234679'; % WoRMS
metaData.links.id_fishbase = 'Notothenia-coriiceps'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notothenia}}';
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
bibkey = 'LinkZuko1980'; type = 'Article'; bib = [ ... 
'author = {T. B. Linkowski and C. Zukowski}, ' ... 
'year = {1980}, ' ...
'title = {Observation on the growth of \emph{Notothenia coriiceps neglecta} {N}ybelin and \emph{Notothenia rossi marmorata} {F}ischer in {A}dmiralty {B}ay ({K}ing {G}eorge {I}sland, {S}outh {S}hetland {I}slands)}, ' ...
'journal = {Polish Polar Research}, ' ...
'volume = {1}, ' ...
'pages = {155--162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PostYan2016'; type = 'Article'; bib = [ ... 
'author = {J. H. Postlethwait and Y. Yan and T. Desvignes and C. Allard and T. Titus and N. R. Le Francois and H. W. Detrich}, ' ... 
'year = {2016}, ' ...
'title = {Embryogenesis and Early Skeletogenesis in the {A}ntarctic Bullhead Notothen, \emph{Notothenia coriiceps}}, ' ...
'journal = {Developmental Dynamics}, ' ...
'volume = {245}, ' ...
'pages = {1066-1080}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitVeit1996'; type = 'Article'; bib = [ ... 
'author = {M. G. White and R. R. Veit and A. W. North and K. Robinson}, ' ... 
'year = {1996}, ' ...
'title = {Egg-shell morphology of the {A}ntarctic fish, \emph{Notothenia rossi} {R}ichardson, and the distribution and adundance of pelagic eggs at {S}outh {G}eorgia and \emph{Notothenia rossi marmorata} {F}ischer in {A}dmiralty {B}ay ({K}ing {G}eorge {I}sland, {S}outh {S}hetland {I}slands)}, ' ...
'journal = {Antarctic Science}, ' ...
'volume = {8}, ' ...
'pages = {267--271}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CaliRigi2017'; type = 'Article'; bib = [ ... 
'author = {F. Cali and E. Riginella and M. La Mesa and C. Mazzoldi}, ' ... 
'year = {2017}, ' ...
'title = {Life history traits of \emph{Notothenia rossii} and \emph{N. coriiceps} along the southern {S}cotia {A}rc}, ' ...
'doi = {DOI 10.1007/s00300-016-2066-z}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {?}, ' ...
'pages = {?}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Summary/SpeciesSummary.php?ID=4702&genusname=Notothenia&speciesname=coriiceps&AT=Notothenia+coriiceps&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

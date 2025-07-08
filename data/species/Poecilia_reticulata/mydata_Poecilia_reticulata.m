function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Poecilia_reticulata'; 
metaData.species_en = 'Guppy'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-S_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 02]; 

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 74;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'GarcTron2008';  
data.Li  = 5.0;    units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'Wiki';

data.Wwb = .008 * data.Lb^3.0447; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GarcTron2008';
  comment.Wwb = 'computed as .008 * Lb^3.0447';
data.Wwi = .008 * data.Li^3.0447;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'GarcTron2008';
  comment.Wwi = 'computed as .008 * Li^3.0447';

data.Ri  = 50/28;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = {'Wiki', 'GarcTron2008'};   
temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
  
% tL data
data.tL = [ ...
 66.43993337	2.58694392;
138.75506271	3.45217778;
244.07172720	3.76037039;
341.34521165	3.96555314;
416.91027567	4.23281536;
480.25133917	4.21154380;
573.87068853	4.67449618;
708.66948654	4.79681784;
797.92428795	4.91960903;
857.28050692	4.87775999;
96.22827933 	2.65880177;
148.52119807	3.33867504;
212.27871048	3.66791465;
250.06124249	3.80154576;
327.71671675	4.16156993;
401.47308597	4.57318069;
466.95355370	4.68590770;
544.52328848	4.97376780;
600.07839038	5.06597857;
681.44924223	5.21977887;
772.48824144	5.17760321;
859.64038411	5.19732330;
136.77488895	3.45219820;
220.39538150	3.83277943;
337.47060361	4.03775804;
456.81996342	4.49013588;
522.20244317	4.52038967;
607.63163052	4.75662235;
681.03279331	4.86926770;
740.54824275	4.96143765;
900.97906323	4.99071156;
103.96524693	2.50408283;
125.80840084	2.55540404;
141.68653645	2.58616818;
166.03654952	3.08076251;
239.59694278	3.32742684;
295.44600862	3.66705726;
352.89554481	3.68708355;
420.63790175	4.03690064;
521.99421871	4.34513408;
642.94404886	4.47790779;
738.02913509	4.50785537;
101.99732166	2.51441240;
149.61948001	2.59639568;
182.03717011	3.21461817;
277.61219624	3.65693183;
401.25261301	4.38761595;
490.66664489	4.64442612;
572.31921218	5.03533692;
588.25859028	5.11764682;
711.23758819	5.29163673;
950.89985628	5.34071237;
126.01662529	2.73065962;
189.82313170	3.10113584;
235.48961327	3.20375784;
299.19813170	3.49176084;
349.08217925	3.81083420;
420.55216227	3.96473658;
571.57205383	4.40647864;
716.47994513	4.70395381;
797.78955448	4.80620836;
859.16269271	4.79526636;
938.44313431	4.85630471];
data.tL = sortrows(data.tL,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth','total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Comf1983';
comment.tL = 'univariate data from Fig 6.3 of DEB3, abundant food';

% food restriction in  period 100-600 d
data.tLf = [ ... % age in d, length in cm
5.98583474e+001	2.47242755e+000;
1.29889045e+002	2.68587630e+000;
2.85745975e+002	2.89668153e+000;
4.43656243e+002	3.17929209e+000;
5.15551748e+002	3.22841235e+000;
5.83561896e+002	3.41112251e+000;
6.53854896e+002	3.95310528e+000;
7.36140044e+002	4.51525255e+000;
7.82129068e+002	4.61650546e+000;
8.79947448e+002	4.63402645e+000;
1.29684121e+002	2.42920910e+000;
1.83804526e+002	2.71501648e+000;
2.05751877e+002	2.70407354e+000;
2.53728663e+002	2.79499828e+000;
2.89672317e+002	2.81442507e+000;
3.45649333e+002	2.92563727e+000;
4.17536641e+002	2.96449085e+000;
4.41488148e+002	2.96375312e+000;
5.11420482e+002	3.05400161e+000;
5.31396465e+002	3.07392022e+000;
5.89369440e+002	3.18507095e+000;
6.05394490e+002	3.25644595e+000;
6.69478296e+002	3.52141256e+000;
7.09528625e+002	3.68445003e+000;
9.38880122e+001	2.59458270e+000;
1.23819199e+002	2.58339385e+000;
1.39827855e+002	2.63423547e+000;
1.49881422e+002	2.72632828e+000;
1.90021918e+002	3.00229931e+000;
2.78024442e+002	3.22546145e+000;
3.78068296e+002	3.53038823e+000;
3.96048320e+002	3.55036831e+000;
4.40082370e+002	3.70301613e+000;
4.80034336e+002	3.74285334e+000;
5.29982490e+002	3.80291654e+000;
5.59946465e+002	3.83279445e+000;
5.79996220e+002	3.94511324e+000;
6.16046435e+002	4.09800697e+000;
6.52047468e+002	4.18930058e+000;
6.98118461e+002	4.39322036e+000;
7.36107256e+002	4.47418580e+000;
8.06072378e+002	4.60550104e+000;
8.44061173e+002	4.68646648e+000;
9.38634213e+001	2.56378263e+000;
2.96029057e+002	3.27624160e+000;
3.28005384e+002	3.32659140e+000;
4.75903070e+002	3.56844260e+000;
5.39839330e+002	3.64860884e+000;
5.77770747e+002	3.65770746e+000;
5.87807920e+002	3.72926689e+000;
5.93869569e+002	3.82148265e+000;
6.42002097e+002	4.10747446e+000;
6.70101264e+002	4.30168085e+000;
7.04229292e+002	4.54703625e+000;
7.32221899e+002	4.60777570e+000;
8.06195332e+002	4.75950136e+000;
8.46171889e+002	4.83013863e+000;
8.70147987e+002	4.86020097e+000;
9.48088747e+002	4.98100362e+000;
1.33692433e+002	2.44961952e+000;
1.77808453e+002	2.70493422e+000;
2.37900340e+002	2.97002379e+000;
2.87815707e+002	2.98902024e+000;
3.35759705e+002	3.03887823e+000;
4.41766845e+002	3.31282051e+000;
4.83739360e+002	3.38339631e+000;
5.33720302e+002	3.48452626e+000;
5.65762205e+002	3.61700957e+000;
6.15816920e+002	3.81053971e+000;
7.25848765e+002	4.12542579e+000;
7.69981179e+002	4.40127387e+000;
8.09924948e+002	4.43084439e+000;
8.45893193e+002	4.48107124e+000;
8.65852782e+002	4.48045647e+000;
3.71908283e+002	3.31497221e+000;
8.19806379e+002	4.30733675e+000];
data.tLf = sortrows(data.tLf,1);
units.tLf = {'d', 'cm'}; label.tLf = {'time since birth','total length'};  
temp.tLf = C2K(23);  units.temp.tLf = 'K'; label.temp.tLf = 'temperature';
bibkey.tLf = 'Comf1983';
comment.tL = 'food restriction in  period 100-600 d';


% abundant food
data.tS = [ ... % age in d, fraction survivors
0.00000000e+000	1.00000000e+000;
1.22727616e+002	9.88417446e-001;
2.00081243e+002	9.71978273e-001;
3.73007114e+002	9.82723230e-001;
7.07125319e+002	9.18501530e-001;
8.14014099e+002	8.21243309e-001;
1.09795562e+003	4.35219303e-001;
1.29451392e+003	3.21414064e-001;
1.51059937e+003	8.30945765e-002;
1.72897831e+003	0.0001];
data.tS = sortrows(data.tS,1);
units.tS = {'d', '-'}; label.tS = {'time since birth', 'surviving fraction'};  
temp.tS = C2K(23);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'Comf1983';
comment.tS = 'abundant food';

% restricted food in period 100--600 d
data.tSf = [ ... % age in d, fraction survivors
0.00000000	1.00000000;
114.73270615	0.99374139;
274.26422745	0.97833394;
886.53627007	0.88715818;
995.36625961	0.83716842;
1087.78223937	0.68749753;
1204.89472530	0.63918656;
1407.57862800	0.47453959;
1593.06484720	0.09112903;
1722.34943939	0.03920885;
1848.03200840	0.0001];
data.tSf = sortrows(data.tSf,1);
units.tSf = {'d', '-'}; label.tSf = {'time since birth', 'surviving fraction'};  
temp.tSf = C2K(23);  units.temp.tSf = 'K'; label.temp.tSf = 'temperature';
bibkey.tSf = 'Comf1983';
comment.tSf = 'food restriction in  period 100-600 d';

% Ursin 1967 at 21 C, DEB3/Table 8.3 
data.tL_Ursi1967 = [...
1.90108749	0.92254080;
6.33349220	1.06585819;
13.75947944	1.20134233;
21.20924886	1.27320912;
27.87569257	1.44047219;
34.55105460	1.58387877;
41.23830772	1.69547667;
48.67024051	1.81505647;
55.32479312	2.01412822;
62.01501902	2.11777396;
68.69632659	2.24527620;
76.15204156	2.30123865;
84.33757233	2.40494384;
111.16982246	2.62867474;
117.88680331	2.66075097;
125.33657274	2.73261776;
132.05058082	2.77264615;
146.23814050	2.82092398;
161.11984271	3.01237057;
166.32368205	3.09210035;
174.51515837	3.17990120;
180.47854123	3.22785203;
195.38997117	3.33977694;
208.03763439	3.50727784;
222.21627576	3.57941218;
237.15743343	3.61181540;
250.53491244	3.82705904;
265.48498844	3.83560576;
278.94273232	3.83614086;
293.10353705	3.95598821;
306.51966212	4.06785366;
320.66263021	4.23541402;
334.86208099	4.25188318;
348.30198824	4.30013129;
362.50143902	4.31660045;
405.10276413	4.35805578];
units.tL_Ursi1967 = {'d', 'cm'}; label.tL_Ursi1967 = {'time since birth','total length'};  
temp.tL_Ursi1967 = C2K(21);  units.temp.tL_Ursi1967 = 'K'; label.temp.tL_Ursi1967 = 'temperature';
bibkey.tL_Ursi1967 = 'Ursi1967';

%% set weights for all real data
weights = setweights(data, []);
weights.tSf = 0 * weights.tSf;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tLf'}; subtitle1 = {'Comf1983 data for ad libitum, food restricted during 100-600 d'};
set2 = {'tS','tSf'}; subtitle2 = {'Comf1983 data for ad libitum, food restricted during 100-600 d'};
set3 = {'tL_Ursi1967'}; subtitle3 = {'Data from Ursi1967'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'This entry concerns the female only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The guppy is ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; % optional bibkey
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KSF6'; % Cat of Life
metaData.links.id_ITIS = '165903'; % ITIS
metaData.links.id_EoL = '208520'; % Ency of Life
metaData.links.id_Wiki = 'Poecilia_reticulata'; % Wikipedia
metaData.links.id_ADW = 'Poecilia_reticulata'; % ADW
metaData.links.id_Taxo = '44613'; % Taxonomicon
metaData.links.id_WoRMS = '154400'; % WoRMS
metaData.links.id_fishbase = 'Poecilia-reticulata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Poecilia_reticulata}}';
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
bibkey = 'GarcTron2008'; type = 'Article'; bib = [ ... 
'author = {C. B. Garc''{i}a and W. Troncoso and S. S\''{a}nchez and L. Perdomo}, ' ... 
'year = {2008}, ' ...
'title = {Contribution to vital statistics of a guppy \emph{Poecilia reticulata} {P}eters ({P}isces: {C}yprinodontiformes: {P}oecillidae) pond population in {S}anta {M}arta, {C}olombia}, ' ...
'journal = {Pan-American Journal of Aquatic Sciences}, ' ...
'volume = {3}, ' ...
'pages = {335--339}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Comf1983'; type = 'Article'; bib = [ ... 
'author = {A. Comfort}, ' ... 
'year = {1983}, ' ...
'title = {Effect of delayed and resumed growth on the longevity of a fish (\emph{Lebistes reticulatus} {P}eters) in captivity.}, ' ...
'journal = {Gerontologia (Basel)}, ' ...
'volume = {8}, ' ...
'pages = {150--155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ursi1967'; type = 'Article'; bib = [ ... 
'author = {E. Ursin}, ' ... 
'year = {1967}, ' ...
'title = {A mathematical model of some aspects of fish growth, respiration, and mortality.}, ' ...
'journal = {J. Fish. Res. Board Can.}, ' ...
'volume = {24}, ' ...
'pages = {2355--2453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

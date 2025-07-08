function [data, auxData, metaData, txtData, weights] = mydata_Obliquaria_reflexa
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Obliquaria_reflexa'; 
metaData.species_en = 'Threehorn wartyback'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 23*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 2.5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 20 yr and tL data';
data.Li  = 5.3;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HaagRype2011';

data.Wwi  = 5.4; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(5.3/7.3)^3';

data.Ri = 40975/365;    units.Ri = '1/d';    label.Ri = 'reproduction rate for SL 4.88 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL_f = [ ... % time settlement birth (yr), shell length (cm)
1.310	1.188
1.832	1.453
2.092	1.502
2.094	1.684
3.032	1.948
3.033	2.113
3.297	2.559
4.031	3.169
4.182	2.609
4.183	2.757
5.020	3.319
5.277	3.055
6.061	3.435
6.063	3.699
6.162	3.188
7.106	4.129
7.107	4.244
7.205	3.552
8.040	3.915
8.247	3.784
9.028	3.834
10.899	3.820
11.790	4.628
12.823	3.871
16.108	4.913
17.870	4.305
18.969	5.081
19.856	5.445
19.905	5.066
20.008	4.934
23.963	5.334];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'shell length', 'female'};  
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HaagRype2011';
comment.tL_f = 'Data for females from Sipsey River, AL; mean temperature is guessed';
%
data.tL_m = [ ... % time since settlement (yr), shell length (cm)
1.151	0.891
1.152	0.990
1.153	1.073
1.154	1.188
1.155	1.336
2.090	1.288
2.144	1.469
2.145	1.601
2.148	1.964
2.199	1.832
2.988	2.888
2.990	3.053
3.038	2.690
3.083	1.784
3.084	1.915
3.085	2.047
3.089	2.542
3.138	2.245
3.139	2.344
3.140	2.426
4.026	2.592
4.030	3.070
4.032	3.301
4.033	3.383
4.034	3.548
4.076	2.378
4.087	3.746
4.131	2.856
4.132	2.939
4.177	2.048
4.183	2.741
4.286	2.675
4.968	3.352
5.021	3.500
5.023	3.714
5.024	3.797
5.025	3.929
5.026	4.093
5.065	2.527
5.068	2.841
5.808	4.325
6.012	3.831
6.014	4.029
6.015	4.177
6.114	3.617
6.161	2.974
6.164	3.336
7.005	4.409
7.102	3.618
7.103	3.799
7.104	3.898
7.107	4.145
7.108	4.293
7.889	4.459
8.044	4.278
8.202	4.525
8.203	4.690
10.021	4.511
11.060	4.380
12.048	4.431
13.978	5.109
16.008	5.325
17.878	5.129
17.879	5.261
18.911	4.372
19.074	5.230
19.958	5.198
20.003	4.390
22.038	5.233];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'shell length', 'male'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HaagRype2011';
comment.tL_m = 'Data for males from Sipsey River, AL; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '74DMM'; % Cat of Life
metaData.links.id_ITIS = '80164'; % ITIS
metaData.links.id_EoL = '449444'; % Ency of Life
metaData.links.id_Wiki = 'Obliquaria_reflexa'; % Wikipedia
metaData.links.id_ADW = 'Obliquaria_reflexa'; % ADW
metaData.links.id_Taxo = '489965'; % Taxonomicon
metaData.links.id_WoRMS = '857242'; % WoRMS
metaData.links.id_molluscabase = '857242'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Obliquaria_reflexa}}';
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
bibkey = 'HaagRype2011'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1469-185X.2010.00146.x}, ' ...
'author = {Wendell R. Haag and Andrew L. Rypel1}, ' ... 
'year = {2011}, ' ...
'title = {Growth and longevity in freshwater mussels: evolutionary and conservation implications}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {86}, ' ...
'pages = {225-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag}, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


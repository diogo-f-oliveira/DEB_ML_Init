function [data, auxData, metaData, txtData, weights] = mydata_Euphlyctis_hexadactylus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Dicroglossidae';
metaData.species    = 'Euphlyctis_hexadactylus'; 
metaData.species_en = 'Indian green frog'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFp', 'jiFm'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-W'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 31];

%% set data
% zero-variate data

data.ab = 10; units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for female at f_l';   bibkey.tp = 'NayaMaha2008';   
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';    label.tpm = 'time since metam at puberty  for male at f_l'; bibkey.tpm = 'NayaMaha2008';   
  temp.tpm = C2K(26);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'NayaMaha2008';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li  = 14.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'NayaMaha2008';
data.Lim  = 14.0; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim = 'NayaMaha2008';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwj = 1.4;  units.Wwj = 'g';  label.Wwj = 'wet weight at metam for female';     bibkey.Wwj = 'guess';
  comment.Wwj = 'based on Euphlyctis_cyanophlyctis';
data.Wwjm = 1.2;  units.Wwjm = 'g';  label.Wwjm = 'wet weight at metam for male';    bibkey.Wwjm = 'guess';
  comment.Wwj = 'based on Euphlyctis_cyanophlyctis';
data.Wwi = 296; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'NayaMaha2008';
data.Wwim = 215; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'NayaMaha2008';

data.Ri  = 2e3/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';                bibkey.Ri  = 'amphibiaweb';
  temp.Ri  = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2000 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW_fm = [ ... % time since metam (d), weight (g)
 1	 59.242  40.726
 1	 68.468  48.580
 1	 73.995  62.716
 1   NaN     90.988
 2	114.814 101.872
 2	201.399  95.589
 2	133.244  64.175
 2	254.831  59.463
 2   NaN     48.469
 3	140.919 120.622
 3   NaN    152.022
 3   NaN    131.603
 4	229.659 247.722
 4   NaN    170.759
 4   NaN    120.491
 4   NaN     79.653
 5	305.504 NaN
 5	204.189 NaN
 6   NaN     99.856
 6   NaN     66.865
 7   NaN    120.150
13   NaN    102.192];
data.tW_fm(:,1) = (data.tW_fm(:,1) + 0.5) * 365; % convert yr to d
units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since metam', 'weight'};  
temp.tW_fm   = C2K(26);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'NayaMaha2008'; treat.tW_fm = {1, {'females','males'}};

% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
 7.384	 56.782
 7.630	 61.929
 7.877	 68.834
 8.410	 72.070
 8.818	 57.784
 9.565	133.019
 9.850	113.522
 9.935	141.617
11.704	200.483
11.909	198.616
12.114	198.508
13.469	227.692
13.472	247.038
13.507	199.532
14.543	295.719];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'female'};  
bibkey.LW_f = 'NayaMaha2008';
%
data.LW_m = [ ... % SVL (cm), weight (g)
 5.689	 46.641
 6.037	 50.988
 6.635	 50.841
 6.884	 95.115
 6.934	 64.068
 7.432	 83.157
 7.730	 93.428
 7.929	 65.301
 7.979	 44.599
 7.979	 97.801
 7.979  103.712
 8.278	 68.170
 8.726	 66.582
 8.925	103.479
 9.473	134.379
 9.523	124.021
 9.573	107.753
 9.871	 85.512
10.021	103.209
10.021	125.377
11.017	156.166
11.963	173.667
13.954	251.501];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'male'};  
bibkey.LW_m = 'NayaMaha2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = 5 * weights.tW_fm;
weights.Wwj = 3 * weights.Wwj;
weights.Wwjm = 3 * weights.Wwjm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3CMHC'; % Cat of Life
metaData.links.id_ITIS = '664950'; % ITIS
metaData.links.id_EoL = '333104'; % Ency of Life
metaData.links.id_Wiki = 'Euphlyctis_hexadactylus'; % Wikipedia
metaData.links.id_ADW = 'Euphlyctis_hexadactylus'; % ADW
metaData.links.id_Taxo = '143435'; % Taxonomicon
metaData.links.id_WoRMS = '1457586'; % WoRMS
metaData.links.id_amphweb = 'Euphlyctis+hexadactylus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euphlyctis_hexadactylus}}';
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
bibkey = 'NayaMaha2008'; type = 'Article'; bib = [ ... 
'author = {Susama Nayak and Pravati K. Mahapatra and Rabindra K. Mohanty and Sushil K. Dutta}, ' ... 
'year = {2008}, ' ...
'title = {A skeletochronological analysis of age, growth and longevity of the {I}ndian Green Frog \emph{Euphlyctis hexadactylus} ({L}esson, 1834) ({A}nura: {R}anidae)}, ' ...
'journal = {Herpetozoa}, ' ...
'volume = {20(3/4)}, ' ...
'pages = {99-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Euphlyctis+hexadactylus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Xenosaurus_platyceps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Xenosauridae';
metaData.species    = 'Xenosaurus_platyceps'; 
metaData.species_en = 'Flathead knob-scaled lizard'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'LdL_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 30];

%% set data
% zero-variate data

data.ab = 9*30.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(22.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Xenosaurus_grandis';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(22.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 5.1;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'RojaLemo2022';
data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'RojaLemo2022';
data.Li  = 12.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'RojaLemo2022';  

data.Wwi = 23.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Lacerta agilis: (12.5/10)^3*12';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.7);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Xenosaurus_grandis: 2 to 7 young per clutch, but possibly less than 1 clutch per yr';

% univariate data
% length - change in length
data.LdL_GF = [ ... % SVL (cm), change in SVL  (cm/d)
5.13262	0.00745
5.13271	0.00754
5.44156	0.00758
5.46998	0.00703
5.47979	0.00720
5.50891	0.00738
6.97513	0.00675
7.05070	0.00505
7.79213	0.00336
8.11243	0.00528
8.39180	0.00477
8.78609	0.00335
8.86267	0.00271
8.86527	0.00541
8.94961	0.00280
9.09546	0.00393
9.12207	0.00151
9.16981	0.00098
9.52764	0.00179
9.59736	0.00403
9.65373	0.00244
9.73930	0.00111
9.83002	0.00512
9.94531	0.00459
10.04863	0.00166
10.11574	0.00121
10.11696	0.00246
10.19532	0.00367
10.20311	0.00174
10.33765	0.00115
10.35663	0.00083
10.38845	0.00379
10.47275	0.00115
10.51054	0.00032
10.59098	0.00367
10.59869	0.00166
10.61727	0.00092
10.68511	0.00121
10.75241	0.00096
10.79296	0.00298
10.80121	0.00152
10.82972	0.00106
10.87743	0.00050
10.89708	0.00086
10.94742	0.00303
10.94772	0.00334
11.02292	0.00127
11.05101	0.00037
11.11981	0.00167
11.12845	0.00063
11.13773	0.00025
11.13847	0.00101
11.14853	0.00143
11.21541	0.00074
11.23429	0.00030
11.25491	0.00167
11.27388	0.00132
11.30246	0.00094
11.37184	0.00283
11.44716	0.00089
11.45640	0.00047
11.49567	0.00116
11.62039	0.00039
11.63992	0.00063
11.78458	0.00054
11.92909	0.00029
11.92928	0.00049
12.05447	0.00021
12.06431	0.00041
12.06453	0.00063
12.17099	0.00096
12.37296	0.00025];
units.LdL_GF  = {'cm', 'cm/d'};  label.LdL_GF = {'SVL', 'change in SVL', 'Gomez Farias'};  
temp.LdL_GF   = C2K(23.4);  units.temp.LdL_GF = 'K'; label.temp.LdL_GF = 'temperature';
bibkey.LdL_GF = 'RojaLemo2022';
comment.LdL_GF = 'Data from Gomez Farias';

% length - change in length
data.LdL_EM = [ ... % SVL (cm), change in SVL  (cm/d)
5.26528	0.00492
5.26710	0.00680
5.30863	0.00984
5.31468	0.00610
5.36221	0.00536
5.38109	0.00492
5.41187	0.00681
5.45945	0.00612
5.49872	0.00681
5.52749	0.00663
5.58488	0.00610
5.59352	0.00505
5.61443	0.00672
5.63382	0.00682
5.65954	0.00346
5.66905	0.00332
5.69810	0.00343
5.73931	0.00612
5.74625	0.00332
5.77531	0.00343
5.84277	0.00334
5.88307	0.00510
5.92046	0.00385
5.93076	0.00452
5.96970	0.00487
5.97792	0.00339
6.03690	0.00450
6.08482	0.00416
6.17961	0.00239
6.33655	0.00502
6.38519	0.00542
6.48918	0.00318
6.58589	0.00340
6.58766	0.00523
6.64383	0.00343
6.86502	0.00265
6.93231	0.00238
6.94245	0.00289
7.12465	0.00169
7.16444	0.00292
7.19408	0.00363
7.31996	0.00407
7.53956	0.00163
7.66561	0.00225
7.83824	0.00114
7.83933	0.00227
7.83978	0.00275
7.88674	0.00140
8.33028	0.00102
8.34066	0.00178
8.35075	0.00224
8.47610	0.00213
8.52323	0.00096
8.55309	0.00191
8.58285	0.00275
8.64909	0.00138
8.69883	0.00293
8.74550	0.00129
8.79333	0.00086
8.91982	0.00193
8.92015	0.00228
8.92996	0.00244
9.00599	0.00122
9.12277	0.00224
9.16042	0.00126
9.36318	0.00137
9.37236	0.00088
9.43139	0.00204
9.43982	0.00079
9.51745	0.00122
9.54606	0.00088
9.63336	0.00133
9.66166	0.00066
9.70049	0.00090
9.74919	0.00137
9.75842	0.00093
9.80674	0.00101
9.83506	0.00035
9.83524	0.00053
9.84503	0.00068
9.88394	0.00101
9.90300	0.00075
9.91346	0.00159
9.93142	0.00020
9.94111	0.00024
9.99022	0.00113
10.01892	0.00088
10.10520	0.00028
10.13427	0.00041
10.13471	0.00086
10.14385	0.00033
10.21168	0.00062
10.25095	0.00132
10.28862	0.00035
10.31789	0.00068
10.38511	0.00033
10.39498	0.00057
10.44343	0.00077
10.47227	0.00066
10.48214	0.00088
10.49219	0.00130
10.53988	0.00072
10.59847	0.00143
10.63624	0.00057
10.66531	0.00070
10.75181	0.00034
10.82886	0.00017
10.83895	0.00063
10.92568	0.00050
10.93582	0.00101
10.95435	0.00021
10.98323	0.00014
11.16669	0.00025
11.45623	0.00028];
units.LdL_EM  = {'cm', 'cm/d'};  label.LdL_EM = {'SVL', 'change in SVL', 'El Madrono'};  
temp.LdL_EM   = C2K(18.3);  units.temp.LdL_EM = 'K'; label.temp.LdL_EM = 'temperature';
bibkey.LdL_EM = 'RojaLemo2022';
comment.LdL_EM = 'Data from El Madrono';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_GF = 3 * weights.LdL_GF;
weights.LdL_EM = 3 * weights.LdL_EM;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_GF','LdL_EM'}; subtitle1 = {'Data from Gomez Farias, El Madrono'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5CBJY'; % Cat of Life
metaData.links.id_ITIS = '586167'; % ITIS
metaData.links.id_EoL = '790700'; % Ency of Life
metaData.links.id_Wiki = 'Xenosaurus_platyceps'; % Wikipedia
metaData.links.id_ADW = 'Xenosaurus_platyceps'; % ADW
metaData.links.id_Taxo = '49716'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Xenosaurus&species=platyceps'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xenosaurus_platyceps}}';
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
bibkey = 'RojaLemo2022'; type = 'Article'; bib = [ ... 
'doi = {10.1111/btp.13144 }, ' ...
'author = {R. Isaac Rojas-Gonz\''{a}lez and Julio A. Lemos-Espinal and Geoffrey R. Smith}, ' ... 
'year = {2022}, ' ...
'title = {Individual growth of the Flathead Knob-scaled Lizard, \emph{Xenosaurus platyceps}, from tropical and temperate populations}, ' ...
'pages = {1217–1225}, ' ...
'volume = {54}, ' ...
'journal = {Biotropica}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


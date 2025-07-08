function [data, auxData, metaData, txtData, weights] = mydata_Dreissena_polymorpha
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Dreissenidae';
metaData.species    = 'Dreissena_polymorpha';
metaData.species_en = 'Zebra mussel'; 

metaData.ecoCode.climate = {'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFe'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'piPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L_fT'; 't-Wd_fT'; 'L-dL'; 'X-F_L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 01]; 

%% set data
% zero-variate data;
data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'ADW';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = 'temperature is guessed'; 
data.am = 10*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'KaraBurl2006';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.026;   units.Lj  = 'cm';   label.Lj  = 'total length at metamorphosis';  bibkey.Lj  = 'JantNeum1998';
data.Lp  = 0.8;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';         bibkey.Lp  = 'JantNeum1998'; 
data.Li  = 4;   units.Li  = 'cm';   label.Li  = 'ultimate total length';              bibkey.Li  = 'KaraBurl2006';
  comment.Li = 'Wiki gives 5.1 cm';

data.Wwb = 3.8e-7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'JantNeum1998';
  comment.Wwb = 'based on egg diameter of 90 mum: pi/6*0.009^3';

data.Ri  = 1e6/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

%  time-length
data.tL = [... % time since settlement (d), shell length (cm)
0.030	0.026
80.320	1.075
106.335	1.139
165.465	1.157
192.413	1.149
221.454	1.153
258.796	1.162
293.082	1.209
333.887	1.467
362.291	1.755
373.868	1.876
393.630	1.919
416.443	1.919
436.145	1.919
462.056	1.911
506.651	1.915
557.485	1.933
589.618	1.924
622.800	1.925
652.890	1.938
695.605	2.080
722.827	2.265
736.386	2.320
755.099	2.355
781.041	2.368
800.749	2.372
826.666	2.368
871.267	2.377];   
units.tL = {'d', 'cm'};  label.tL = {'age', 'shell length'};
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JantNeum1998';
comment.tL = 'Data from River Rhine; Temperature and food varies, see discussion';

% time -weight
data.tWd = [... % time since settlement (d), AFDW (mg)
84.075	7.559
111.093	5.374
169.017	4.006
193.163	4.619
225.033	5.237
259.817	7.656
288.838	13.671
333.414	31.696
360.555	43.511
374.089	45.318
400.015	28.732
415.403	21.741
437.568	16.753
460.761	18.766
507.082	15.591
558.288	18.819
584.403	23.833
589.231	23.836
626.874	22.057
655.965	36.073
695.944	80.295
722.236	105.509
734.531	76.116
755.450	39.127
782.471	37.342
802.705	32.353
828.747	28.967
873.088	20.192];   
units.tWd = {'d', 'mg'};  label.tWd = {'age', 'AFDW'};
temp.tWd = C2K(15);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'JantNeum1998';
comment.tWd = 'Data from River Rhine; Temperature and food varies, see discussion';

% length - change in length
data.LdL = [ ... % intitial length (cm), change in length (cm/d)
0.79077	0.00868
0.83365	0.00770
0.85523	0.00633
0.86039	0.00878
0.88213	0.00755
0.88548	0.00645
0.88965	0.00804
0.92756	0.00878
0.93241	0.00696
0.93511	0.01129
0.93557	0.00769
0.98396	0.00746
0.98800	0.00896
1.00864	0.00677
1.02301	0.00918
1.07781	0.01049
1.15656	0.00848
1.40556	0.00544
1.43503	0.00489
1.53778	0.00360
1.61742	0.00435
1.62626	0.00398
1.65876	0.00404
1.70480	0.00379
1.71447	0.00414
1.72719	0.00312
1.73267	0.00385
1.75938	0.00492
1.80734	0.00432
1.83117	0.00289
1.85410	0.00268
1.89144	0.00092
1.93610	0.00348
1.97458	0.00270
2.02599	0.00308
2.12548	0.00298];
units.LdL = {'cm', 'cm/d'};  label.LdL = {'shell length', 'change in shell length'};
temp.LdL = C2K(18);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'KaraBurl2006';
comment.LdL = 'Data from Svisloch River; temperature is guessed';

% food density - spec filtering rate
data.XF1992 = [  ... % POC (mg/L), filtering rate (mL/mg AFDW/ h)
0.355	23.739
0.391	16.575
0.428	32.022
0.514	8.300
0.612	28.208
0.636	16.903
0.893	9.111
1.076	5.774
1.125	9.439
1.664	4.046
2.410	4.235
3.303	12.710];
units.XF1992 = {'mg/L', 'ml/mg AFDW/h'};  label.XF1992 = {'POC', 'specific filtering rate'};
temp.XF1992 = C2K(20);  units.temp.XF1992 = 'K'; label.temp.XF1992 = 'temperature';
length.XF1992 = 0.6;  units.length.XF1992 = 'cm'; label.length.XF1992 = 'mean shell length';
bibkey.XF1992 = 'FansNale1995';
comment.XF1992 = 'Data for 1992 Saginay Bay';
%
data.XF1993 = [  ... % POC (mg/L), filtering rate (mL/mg AFDW/ h)
0.157	38.414
0.162	12.472
0.201	13.585
0.229	20.355
0.259	17.692
0.266	29.015
0.325	40.668
0.350	8.443
0.451	12.406
0.511	11.324
0.648	12.468
0.778	5.748];
units.XF1993 = {'mg/L', 'ml/mg AFDW/h'};  label.XF1993 = {'POC', 'specific filtering rate'};
temp.XF1993 = C2K(20);  units.temp.XF1993 = 'K'; label.temp.XF1993 = 'temperature';
length.XF1993 = 0.79;  units.length.XF1993 = 'cm'; label.length.XF1993 = 'mean shell length';
bibkey.XF1993 = 'FansNale1995';
comment.XF1993 = 'Data for 1992 Saginay Bay';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'XF1993','XF1992'}; subtitle1 = {'Data for 1993, 1992'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% discussion
D1 = 'Temperature in C for tL and tWd data is assumed to vary as T(t) = 15 + 10*cos(2*pi*t/365)';
D2 = 'f for tL and tWd data is assumed to vary as f(t) = (0.8 + 0.2*cos(2*pi*(t+120)/365)).^2';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '37M79'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46470938'; % Ency of Life
metaData.links.id_Wiki = 'Dreissena_polymorpha'; % Wikipedia
metaData.links.id_ADW = 'Dreissena_polymorpha'; % ADW
metaData.links.id_Taxo = '39857'; % Taxonomicon
metaData.links.id_WoRMS = '181566'; % WoRMS
metaData.links.id_molluscabase = '181566'; % MolluscaBase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dreissena_polymorpha}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = [...
'howpublished = {\url{https://animaldiversity.org/accounts/Dreissena_polymorpha/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KaraBurl2006'; type = 'Article'; bib = [ ... 
'doi = {10.2983/0730-8000(2006)25[23:GRALOD]2.0.CO;2}, ' ...
'author = {Alexander Y. Karatayev and Lyubov E. Burlakova and Dianna K. Padilla}, ' ... 
'year = {2006}, ' ...
'title = {Growth rate and longevity of \emph{Dreissena polymorpha} ({P}allas): {A} review and recommendations for future study}, ' ...
'journal = {Journal of Shellfish Research}, ' ...
'volume = {25}, ' ...
'number = {1}, '...
'pages = {23-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JantNeum1998'; type = 'Article'; bib = [ ... 
'author = {B. Jantz and D. Neumann}, ' ... 
'year = {1998}, ' ...
'title = {Growth and reproductive cycle of the zebra mussel in the {R}iver {R}hine as studied in a river bypass}, ' ...
'journal = {Oecologia}, ' ...
'volume = {114}, ' ...
'pages = {213-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FansNale1995'; type = 'Article'; bib = [ ... 
'author = {David L. Fanslow anf Thomas F. Naleps and Gregory A. Lang}, ' ... 
'year = {1995}, ' ...
'title = {Filtering rates of the zebra mussel (\emph{Dreissena polymorpha}) on natural seston from {S}aginaw {B}ay, {L}ake {H}uron}, ' ...
'journal = {J. Great Lales Res.}, ' ...
'volume = {21(4)}, ' ...
'pages = {489-500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Gerres_oyena

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Gerres_oyena'; 
metaData.species_en = 'Common silver-biddy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2020 09 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 20]; 


%% set data
% zero-variate data

data.am = 8.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KanaTach2006';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temps are guessed; am of 10 yr is oldest year class in tL data';
  
data.Lp  = 16.7;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'KanaTach2006'; 
  comment.Lp = 'based on SL 13.9 cm and F2';
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.54e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LamtPrat2007';
  comment.Wwb = 'based guessed egg diameter of 0.5 mm: pi/6*0.05^3'; 
data.Wwp = 70.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'KanaTach2006';
  comment.Wwp = 'based on 0.036*13.9^2.88, see F1';
data.Wwi = 378; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KanaTach2006';
  comment.Wwi = 'based on 0.036*(0.83*30)^2.88, see F1';

data.R20  = 367200/365; units.R20  = '#/d';label.R20  = 'max reprod rate at TL 20.1 cm';  bibkey.R20  = 'LamtPrat2007';   
  temp.R20 = C2K(20); units.temp.R20 = 'K'; label.temp.R20 = 'temperature';
  
% uni-variate data
% time - length
data.tL = [  ... % time since birth (yr), standard length (cm)
-0.010	6.888
-0.009	7.975
-0.009	8.531
-0.008	9.035
0.000	5.749
0.003	9.167
0.012	5.961
0.013	7.392
0.023	6.464
0.025	8.346
0.034	6.093
0.047	9.459
0.976	8.723
0.999	9.041
1.000	10.048
1.000	10.181
1.000	10.260
1.000	10.260
1.000	10.340
1.000	10.367
1.000	10.473
1.000	10.473
1.000	10.605
1.001	11.877
1.009	8.405
1.012	11.374
1.012	11.612
1.021	9.333
1.021	9.413
1.021	9.625
1.021	9.704
1.021	9.837
1.022	11.135
1.033	10.976
1.044	10.897
1.055	10.817
1.998	13.871
2.007	11.407
2.008	11.513
2.008	11.592
2.008	11.698
2.008	11.725
2.008	11.804
2.008	11.831
2.008	11.884
2.008	11.963
2.008	12.043
2.008	12.069
2.008	12.122
2.008	12.175
2.008	12.334
2.008	12.520
2.008	12.626
2.018	11.354
2.019	12.679
2.029	10.585
2.029	10.718
2.029	10.903
2.029	11.036
2.029	11.036
2.029	11.168
2.031	12.732
2.031	12.891
2.042	13.527
2.053	13.209
2.992	10.777
2.993	11.996
2.994	14.381
2.995	14.779
2.995	15.044
3.005	13.984
3.005	14.090
3.015	12.235
3.015	12.367
3.015	12.447
3.016	13.560
3.017	15.389
3.017	15.468
3.017	15.654
3.025	11.228
3.026	12.553
3.026	12.580
3.026	12.712
3.026	12.792
3.026	12.871
3.027	13.004
3.027	13.083
3.027	13.163
3.027	13.295
3.978	12.162
3.981	16.614
4.000	12.348
4.000	12.454
4.000	12.639
4.010	11.314
4.010	11.632
4.011	12.798
4.011	12.984
4.011	13.063
4.012	13.302
4.012	13.381
4.012	13.487
4.012	13.540
4.012	13.646
4.012	13.726
4.012	13.832
4.012	13.911
4.012	13.991
4.012	14.044
4.012	14.123
4.012	14.203
4.012	14.335
4.012	14.494
4.013	15.263
4.013	15.554
4.013	15.819
4.022	11.844
4.022	12.003
4.022	12.136
4.024	14.971
4.025	15.978
4.033	11.791
4.046	14.627
4.047	16.164
4.058	16.323
4.976	15.773
4.987	16.091
4.996	12.937
4.996	13.335
4.997	14.554
4.998	15.243
4.998	15.375
4.999	16.223
4.999	16.303
4.999	16.329
4.999	16.409
4.999	16.515
5.008	13.547
5.009	15.137
5.010	16.807
5.019	13.759
5.030	14.103
5.030	14.262
5.042	14.740
5.042	14.846
5.042	14.925
5.042	15.005
5.985	19.092
5.994	15.859
5.994	16.203
5.994	16.283
6.006	16.416
6.006	16.601
6.015	14.481
6.017	16.972
6.017	17.264
6.017	17.343
6.017	17.423
6.017	17.529
6.018	17.741
6.018	18.191
6.991	17.562
7.014	17.853
7.014	18.251
7.014	18.516
8.009	17.780
8.009	17.939
8.011	19.715
8.021	18.205];
data.tL(:,1) = 365 * (1.2 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.83; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KanaTach2006';

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Assumed: 2 batches per yr with partial early spawning';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'weight-length relationship: W in g = 0.036*(SL in cm)^2.88';
metaData.bibkey.F1 = 'KanaTach2006'; 
F2 = 'length-length from photo: SL = 0.83*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3FX3Y'; % Cat of Life
metaData.links.id_ITIS = '169044'; % ITIS
metaData.links.id_EoL = '46580896'; % Ency of Life
metaData.links.id_Wiki = 'Gerres_oyena'; % Wikipedia
metaData.links.id_ADW = 'Gerres_oyena'; % ADW
metaData.links.id_Taxo = '106126'; % Taxonomicon
metaData.links.id_WoRMS = '218535'; % WoRMS
metaData.links.id_fishbase = 'Gerres-oyena'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerres_oyena}}';
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
bibkey = 'KanaTach2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2006.00804}, ' ...
'author = {M. K. Kanak and K. Tachihara}, ' ... 
'year = {2006}, ' ...
'title = {Age and growth of \emph{Gerres oyena} (Forssk{\aa}l, 1775) on {O}kinawa {I}sland, {J}apan}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {22}, ' ...
'pages = {310-313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LamtPrat2007'; type = 'Article'; bib = [ ... 
'author = {H.A. Lamtane and, H.B. Pratap and S.M.G. Ndaro}, ' ... 
'year = {2007}, ' ...
'title = {Reproductive Biology of \emph{Gerres oyena} ({P}isces: {G}erreidae) Along the {B}agamoyo {C}oast, {T}anzania}, ' ...
'journal = {Western Indian Ocean J. Mar. Sci.}, ' ...
'volume = {6(1)}, ' ...
'pages = {29-35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gerres-oyena.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


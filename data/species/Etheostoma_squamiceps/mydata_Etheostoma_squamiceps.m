  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_squamiceps
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_squamiceps'; 
metaData.species_en = 'Spottail darter'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L';'L-N';'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 04]; 

%% set data
% zero-variate data
data.tp = 0.8*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'Page1974';   
  temp.tp = C2K(16.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 3.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Page1974';   
  temp.am = C2K(16.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.1;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'Page1974'; 
data.Li = 7.66;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 8.8, SL = 0.87 * TL';

data.Wwb = 2.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Page1974';
  comment.Wwb = 'based on egg diameter of 1.6 mm: pi/6*0.16^3';
data.Wwi = 4.74;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*(8.8)^3.14, see F1, F2; but ignored because of inconsistency with LWw data';
 
% univariate data
% time-length
data.tL_BCf = [ ... % time since birth (yr), std length (cm)
0.167	1.504
0.251	1.675
0.413	2.144
0.491	2.504
0.575	2.879
0.663	3.207
0.737	2.749
0.816	2.826
0.899	3.501
0.983	3.593
1.072	3.733
1.161	3.982
1.229	3.823
1.318	4.215
1.412	4.134
1.491	4.069
1.558	4.728
1.653	4.411
1.737	4.299
1.826	4.203
1.905	4.390
1.989	4.545
2.094	4.543
2.145	5.108
2.235	5.027
2.319	4.632
2.392	5.118
2.481	4.864
2.565	5.035
2.810	5.989
2.989	5.655];
data.tL_BCf(:,1) = 365 * (0 + data.tL_BCf(:,1));  % convert yr to d
units.tL_BCf = {'d', 'cm'}; label.tL_BCf = {'time since birth', 'standard length', 'female'};  
temp.tL_BCf = C2K(16.5);  units.temp.tL_BCf = 'K'; label.temp.tL_BCf = 'temperature';
bibkey.tL_BCf = 'Page1974';
comment.tL_BCf = 'Data for females from Big Creek';
%
data.tL_BCm = [ ... % time since birth (yr), std length (cm)
0.172	1.677
0.256	1.817
0.334	2.177
0.423	2.269
0.502	2.346
0.564	3.052
0.664	2.877
0.774	2.701
0.826	3.078
0.910	3.249
0.999	3.498
1.077	4.204
1.160	4.155
1.260	4.310
1.317	5.017
1.417	4.433
1.480	4.195
1.584	5.058
1.652	5.135
1.826	4.753
1.983	5.049
2.087	5.251
2.156	4.809
2.229	5.310
2.333	5.953
2.402	4.945
2.481	5.242
2.580	5.743
2.664	5.819
2.757	6.541
2.898	6.884
2.988	6.142
3.082	6.392];
data.tL_BCm(:,1) = 365 * (0 + data.tL_BCm(:,1));  % convert yr to d
units.tL_BCm = {'d', 'cm'}; label.tL_BCm = {'time since birth', 'standard length', 'male'};  
temp.tL_BCm = C2K(16.5);  units.temp.tL_BCm = 'K'; label.temp.tL_BCm = 'temperature';
bibkey.tL_BCm = 'Page1974';
comment.tL_BCm = 'Data for males from Big Creek';

% time-length
data.tL_FCf = [ ... % time since birth (yr), std length (cm)
0.138	1.474
0.228	2.219
0.323	3.011
0.396	2.755
0.497	3.325
0.560	3.467
0.655	3.766
0.733	3.463
0.822	3.318
0.891	3.729
1.001	3.758
1.059	4.091
1.169	3.945
1.237	3.975
1.316	4.005
1.406	4.416
1.505	4.525
1.564	4.953
1.653	4.792
1.742	4.869
1.815	4.883
1.904	4.770
1.984	5.181
2.068	5.529
2.161	4.780
2.241	5.382
2.582	5.501
2.661	5.499
2.735	5.926
2.824	6.147
2.902	5.621
3.407	6.642];
data.tL_FCf(:,1) = 365 * (0 + data.tL_FCf(:,1));  % convert yr to d
units.tL_FCf = {'d', 'cm'}; label.tL_FCf = {'time since birth', 'standard length', 'female'};  
temp.tL_FCf = C2K(16.5);  units.temp.tL_FCf = 'K'; label.temp.tL_FCf = 'temperature';
bibkey.tL_FCf = 'Page1974';
comment.tL_FCf = 'Data for females from Furguson Creek';
%
data.tL_FCm = [ ... % time since birth (yr), std length (cm)
0.169	1.378
0.254	2.060
0.334	3.075
0.407	3.025
0.491	3.198
0.586	3.228
0.649	3.465
0.743	2.970
0.832	3.063
0.911	3.538
1.001	3.838
1.086	4.376
1.159	4.104
1.327	4.323
1.422	4.543
1.570	5.334
1.747	4.631
1.995	5.753
2.079	5.688
2.252	5.588
2.582	5.803
2.760	5.640
2.830	6.433
2.920	7.209
3.003	6.397
3.082	6.935];
data.tL_FCm(:,1) = 365 * (0 + data.tL_FCm(:,1));  % convert yr to d
units.tL_FCm = {'d', 'cm'}; label.tL_FCm = {'time since birth', 'standard length', 'male'};  
temp.tL_FCm = C2K(16.5);  units.temp.tL_FCm = 'K'; label.temp.tL_FCm = 'temperature';
bibkey.tL_FCm = 'Page1974';
comment.tL_FCm = 'Data for males from Furguson Creek';

% length - weight - fecundity
LWN = [ ... % std length (cm), weight (g), mature ova (#)
   3.2 0.57 54
   3.5 0.59 44
   3.7 0.74 80
   4.0 0.93 40
   4.1 0.85 56
   4.2 1.11 70 
   4.3 1.05 50
   4.4 1.18 64
   4.8 1.27 28
   4.8 1.79 140
   4.8 1.64 110
   4.9 1.71 132
   5.1 2.27 91
   5.1 2.16 116
   5.5 2.56 80
   5.5 2.77 234
   5.7 3.32 227
   5.8 3.22 357];
data.LN = LWN(:,[1 3]); % std length (cm), mature ova (#)
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(16.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Page1974';

% length - weight
data.LWw = LWN(:, 1:2); % std length (cm), wet weigt (g)
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'Page1974';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;
weights.Li = 5 * weights.Li;
weights.Lp = 5 * weights.Lp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_BCf', 'tL_BCm'}; subtitle1 = {'Data for females, males from Big Creek'};
set2 = {'tL_FCf', 'tL_FCm'}; subtitle2 = {'Data for females, males from Furguson Creek'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperature is guessed, but varied between 0 and 27 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-length from photo: SL = 0.87 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL75'; % Cat of Life
metaData.links.id_ITIS = '168436'; % ITIS
metaData.links.id_EoL = '223379'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_squamiceps'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_squamiceps'; % ADW
metaData.links.id_Taxo = '174155'; % Taxonomicon
metaData.links.id_WoRMS = '1020186'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-squamiceps'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_squamiceps}}';  
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
bibkey = 'Page1974'; type = 'Techreport'; bib = [ ... 
'author = {Lawrence M. Page}, ' ...
'year = {1974}, ' ...
'title = {The life history of the spottail darter, \emph{Etheostoma squamiceps}, in {B}ig {C}reek, {I}llinois, and {F}erguson {C}reek, {K}entucky}, ' ... 
'institution = {Dept Energy and Natural Resources, Illenois Natural History Survey}, ' ...
'series = {Biological notes}, ' ...
'volume = {89}, ' ...
'pages = {471-485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-squamiceps}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

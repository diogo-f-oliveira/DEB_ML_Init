function [data, auxData, metaData, txtData, weights] = mydata_Acentrogobius_pflaumii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Acentrogobius_pflaumii'; 
metaData.species_en = 'Striped sandgobi'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 25];

%% set data
% zero-variate data

data.ab = 16;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(17.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4.5*365;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'fishbase';   
  temp.am = C2K(17.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'fishbase gives 27 cm, but that is unlikely given Li';
data.Li  = 30; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0023; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Hoga2015';
  comment.Wwb = 'based on egg diameter of 0.48 mm: pi/6*0.048^3';
data.Wwp = 24;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00692*Lp^3.01, see F1';
data.Wwi = 193;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.01, see F1';

data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Hoga2015';
  temp.GSI = C2K(17.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (yr), total length (cm)
0.315	4.781
0.371	4.517
0.626	5.835
0.643	7.287
0.643	6.396
0.652	7.518
0.653	5.405
0.662	6.594
0.662	5.768
0.663	5.075
0.663	4.943
0.680	6.164
0.800	4.777
0.807	7.483
0.808	6.988
0.817	7.120
0.817	6.658
0.819	4.513
0.826	6.823
0.827	5.635
0.827	5.338
0.845	5.899
0.854	6.262
0.863	6.526
0.863	6.130
0.864	5.305
0.901	5.040
0.918	6.426
0.937	5.898
0.937	5.469
0.946	5.898
0.954	7.053
0.956	5.370
0.965	5.271
0.973	6.459
0.974	5.601
0.982	6.591
0.983	5.766
1.155	7.052
1.156	6.424
1.157	5.137
1.164	7.315
1.174	6.853
1.193	6.457
1.210	7.084
1.211	5.830
1.229	6.754
1.275	6.819
1.303	5.961
1.348	6.621
1.366	7.479
1.385	5.729
1.457	7.742
1.521	7.874
1.530	7.576
1.532	5.992
1.612	7.807
1.639	8.368
1.641	6.882
1.641	6.684
1.649	7.906
1.668	7.212
1.669	5.958
1.679	4.935
1.686	7.575
1.779	5.726
1.786	8.003
1.795	8.201
1.797	6.287
1.797	5.891
1.803	9.422
1.805	7.607
1.805	7.112
1.813	8.366
1.816	4.934
1.825	5.132
1.842	6.782
1.843	6.056
1.851	6.584
1.859	8.003
1.869	7.442
1.869	7.310
1.880	5.230
1.889	5.725
1.897	6.979
1.897	6.352
1.898	6.055
1.917	5.197
1.934	6.616
1.934	6.385
1.943	6.913
1.951	8.167
1.960	7.639
1.962	5.692
1.971	6.187
1.972	5.131
1.981	5.031
1.988	7.936
2.226	7.175
2.364	6.513
2.446	7.503
2.519	7.337
2.528	7.733
2.528	7.007
2.628	8.690
2.646	8.491
2.646	8.293
2.647	7.963
2.656	7.534
2.656	7.105
2.675	7.270
2.785	7.038
2.792	8.952
2.802	8.292
2.802	7.863
2.803	7.236
2.803	6.741
2.804	6.081
2.812	7.533
2.820	8.622
2.820	8.028
2.875	7.862
2.885	7.499
2.895	6.773
3.801	6.634];
data.tL_f(:,1) = (0.5+data.tL_f(:,1))*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'females'};  
temp.tL_f   = C2K(17.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hoga2015'; 
%
data.tL_m = [ ... % time (yr), total length (cm)
0.666	5.548
0.675	5.050
0.686	6.512
0.786	6.312
0.795	5.781
0.796	6.811
0.824	7.276
0.832	6.611
0.841	5.515
0.842	7.409
0.878	6.179
0.878	6.777
0.896	6.013
0.906	6.346
0.915	7.076
0.931	4.551
0.933	6.578
1.006	5.748
1.006	6.312
1.182	7.276
1.191	7.043
1.218	7.143
1.310	6.844
1.392	6.312
1.392	7.010
1.393	7.409
1.412	7.807
1.504	8.571
1.669	8.106
1.695	6.645
1.806	7.807
1.814	5.980
1.824	6.877
1.824	7.309
1.832	6.412
1.841	5.581
1.853	8.472
1.860	6.146
1.870	7.243
1.888	7.110
1.895	5.050
1.896	6.047
1.898	7.741
1.906	6.744
1.907	8.206
1.914	5.316
1.915	6.478
1.923	5.847
1.925	7.608
1.970	6.578
1.977	4.684
1.980	7.243
1.980	7.741
1.987	5.183
2.006	5.548
2.403	8.206
2.504	9.037
2.577	8.272
2.641	8.007
2.642	8.638
2.650	7.309
2.651	9.169
2.669	8.239
2.677	7.641
2.686	6.844
2.688	9.635
2.715	8.405
2.814	6.711
2.815	7.708
2.815	7.973
2.816	8.870
2.841	6.412
2.842	6.910
2.842	7.243
2.843	8.538
2.888	6.811
2.906	6.478
2.907	8.007
3.688	9.269
3.706	8.571
3.935	8.870];
data.tL_m(:,1) = (0.5+data.tL_m(:,1))*365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'males'};  
temp.tL_m   = C2K(17.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hoga2015'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64FFX'; % Cat of Life
metaData.links.id_ITIS = '636895'; % ITIS
metaData.links.id_EoL = '46575909'; % Ency of Life
metaData.links.id_Wiki = 'Acentrogobius'; % Wikipedia
metaData.links.id_ADW = 'Acentrogobius_pflaumii'; % ADW
metaData.links.id_Taxo = '160003'; % Taxonomicon
metaData.links.id_WoRMS = '278785'; % WoRMS
metaData.links.id_fishbase = 'Acentrogobius-pflaumii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acentrogobius}}';
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
bibkey = 'Hoga2015'; type = 'phdthesis'; bib = [ ...
'howpublished = {\url{https://researchportal.murdoch.edu.au/esploro/outputs/graduate/Biology-and-ecology-of-the-non-indigenous/991005544383807891#file-0}}, ' ...
'author = {Hogan-West, K.}, ' ... 
'year = {2015}, ' ...
'title = {Biology and ecology of the non-indigenous goby \emph{Acentrogobius pflaumii} (Bleeker 1853) in the Swan-Canning Estuary}, ' ...
'school = {Murdoch University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acentrogobius-pflaumii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



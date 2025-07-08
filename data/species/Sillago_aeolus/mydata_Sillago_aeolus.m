function [data, auxData, metaData, txtData, weights] = mydata_Sillago_aeolus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_aeolus'; 
metaData.species_en = 'Oriental sillago';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 14];

%% set data
% zero-variate data

data.ab = 4;       units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4*365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'RahmTach2005';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at least 5 yrs';

data.Lp  = 12; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 30;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Sillago sihama: pi/6*0.066^3';
data.Wwi = 197.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00617*Li^3.05, see F1';
 
data.Ri  = 136e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 136000';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
0.399	10.078
0.402	5.852
0.408	10.500
0.409	9.655
0.409	9.303
0.409	9.092
0.410	8.388
0.411	6.909
0.477	8.952
0.494	11.558
0.496	8.389
0.505	9.939
0.505	9.727
0.505	9.375
0.521	13.953
0.586	15.785
0.589	12.687
0.591	9.658
0.591	9.236
0.592	9.025
0.598	13.180
0.600	10.222
0.605	17.053
0.606	15.433
0.607	14.236
0.607	13.955
0.607	13.532
0.609	11.490
0.616	15.011
0.628	12.053
0.691	16.984
0.693	14.379
0.693	13.886
0.700	17.689
0.721	15.295
0.721	14.942
0.800	13.113
0.802	9.944
0.808	14.310
0.810	11.564
0.812	9.240
0.818	14.029
0.819	12.761
0.826	16.282
0.830	10.930
0.897	11.213
0.904	14.523
0.914	14.242
0.916	11.706
0.923	15.016
0.933	13.749
0.968	19.172
0.989	16.004
0.994	9.947
0.994	9.525
0.997	17.975
1.003	10.722
1.009	15.159
1.009	14.666
1.010	13.257
1.011	12.694
1.012	11.426
1.012	11.074
1.016	18.257
1.017	16.708
1.020	13.962
1.021	11.849
1.029	13.539
1.091	20.512
1.102	18.470
1.113	16.992
1.113	16.569
1.115	14.738
1.116	13.682
1.117	12.133
1.120	20.724
1.122	17.837
1.177	21.570
1.187	20.584
1.200	16.430
1.206	20.937
1.209	17.627
1.210	15.303
1.217	18.754
1.218	18.120
1.218	17.416
1.221	14.317
1.240	14.599
1.296	16.431
1.505	18.477
1.516	16.576
1.594	15.873
1.599	21.226
1.603	16.226
1.604	15.099
1.605	13.197
1.611	18.761
1.621	18.198
1.631	17.564
1.631	17.212
1.687	18.833
1.696	20.523
1.705	20.030
1.706	19.608
1.774	18.905
1.797	13.905
1.883	13.766
1.889	18.202
1.900	16.231
1.901	15.879
1.971	23.838
1.984	19.049
1.986	17.077
1.990	24.472
1.993	19.824
2.002	21.021
2.070	20.670
2.070	20.318
2.071	18.276
2.078	22.713
2.079	21.445
2.097	22.150
2.099	19.333
2.171	25.954
2.186	18.560
2.193	22.504
2.195	20.180
2.204	20.743
2.385	22.437
2.395	21.732
2.395	21.240
2.580	18.144
2.780	19.415
2.799	20.472
2.891	24.558
2.894	20.615
2.902	23.854
2.912	22.868
3.073	25.970
3.093	24.350
3.093	23.857
3.104	22.168
3.369	27.595
3.381	24.215
4.013	25.705];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365;
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length','females'};  
temp.tL_f  = C2K(28.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RahmTach2005';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
0.384	7.202
0.393	7.486
0.412	8.053
0.412	9.965
0.422	6.353
0.422	9.186
0.422	11.948
0.499	7.983
0.508	7.700
0.518	10.462
0.518	9.542
0.585	15.634
0.604	16.271
0.604	14.997
0.604	14.359
0.614	16.909
0.614	13.509
0.624	13.085
0.624	12.943
0.624	11.739
0.624	11.031
0.633	10.181
0.719	16.982
0.729	11.883
0.729	12.662
0.729	13.441
0.729	14.078
0.796	10.538
0.815	11.884
0.815	13.088
0.815	14.363
0.815	14.717
0.825	12.522
0.825	13.796
0.825	15.355
0.902	16.914
0.902	12.452
0.902	10.894
0.921	15.710
0.921	14.719
0.921	13.373
0.921	11.390
0.930	14.223
0.930	13.940
0.930	10.399
0.959	17.765
0.959	15.569
0.959	9.620
0.978	16.490
0.978	11.108
0.988	9.338
0.988	8.559
0.998	15.216
0.998	13.870
0.998	13.375
0.998	13.091
0.998	12.312
0.998	11.392
1.074	15.430
1.084	16.421
1.084	17.696
1.094	13.660
1.103	11.748
1.103	14.368
1.103	16.918
1.113	19.467
1.189	14.157
1.189	13.166
1.189	12.882
1.189	12.599
1.189	12.316
1.199	20.460
1.209	15.574
1.218	17.415
1.218	16.565
1.285	13.663
1.285	15.292
1.573	17.422
1.573	17.068
1.583	18.272
1.583	12.606
1.592	13.456
1.602	16.572
1.621	15.864
1.698	14.945
1.698	15.228
1.707	14.520
1.707	16.999
1.717	17.495
1.794	15.867
1.803	17.497
1.803	16.859
1.813	16.364
1.823	18.559
1.823	15.231
1.880	17.994
1.880	18.489
1.909	13.391
1.909	15.445
1.938	14.454
2.110	17.998
2.206	20.691
2.705	19.354
2.724	16.380
2.830	19.356
2.830	19.852
2.916	22.049
2.916	16.808
2.926	20.703];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365;
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length','males'};  
temp.tL_m  = C2K(28.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RahmTach2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00617*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XDNN'; % Cat of Life
metaData.links.id_ITIS = '646036'; % ITIS
metaData.links.id_EoL = '46579886'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_aeolus'; % Wikipedia
metaData.links.id_ADW = 'Sillago_aeolus'; % ADW
metaData.links.id_Taxo = '187636'; % Taxonomicon
metaData.links.id_WoRMS = '218370'; % WoRMS
metaData.links.id_fishbase = 'Sillago-aeolus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_aeolus}}';
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
bibkey = 'RahmTach2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10872-005-0065-8}, ' ...
'author = {Habibur Rahman and Katsunori Tachihara}, ' ... 
'year = {2005}, ' ...
'title = {Age and Growth of \emph{Sillago aeolus} in {O}kinawa {I}sland, {J}apan}, ' ...
'journal = {Journal of Oceanography}, ' ...
'volume = {61(3)}, ' ...
'pages = {569–573}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago-aeolus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

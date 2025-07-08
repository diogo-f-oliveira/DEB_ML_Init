  function [data, auxData, metaData, txtData, weights] = mydata_Clupea_bentincki

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Clupea_bentincki'; 
metaData.species_en = 'Araucanian herring'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ab';  'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};                  
metaData.date_subm   = [2019 01 08];                      
metaData.email       = {'bas.kooijman@vu.nl'};      
metaData.address     = {'VU University Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 08]; 

%% set data
% zero-variate data
data.ab = 27;      units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess'; 
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on value for Clupea harengus';
data.am = 22*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on value for Clupea harengus';

data.Lp = 10;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Wiki'; 
  comment.Lp = 'mean';
data.Li = 30.7;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on 28.4 cm SL, converted to TL by TL = SL/ 0.925, from photo';

data.Wwb = 2.6e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase'; 
  comment.Wwb = 'based on egg diameter 1.7 mm for Clupea harengus: pi/6*0.17^3';
data.Wwi = 333;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on same length-weight, compared to Clupea harrengus: (30.7/45)^3*1050';
  
data.Ri = 2e4/365/3;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same weight-specific rate, compared to to Clupea harrengus';
    
% uni-variate data
% time-length
data.tL = [ ... % time (a), length (m)
0.248	5.468
0.248	7.154
0.319	6.886
0.328	5.166
0.333	5.436
0.333	5.604
0.333	5.739
0.333	5.739
0.333	5.807
0.333	5.908
0.333	6.009
0.333	6.245
0.333	6.582
0.337	5.672
0.337	5.975
0.403	7.292
0.407	5.201
0.407	5.572
0.407	7.056
0.412	5.977
0.412	6.112
0.412	6.280
0.412	6.651
0.412	6.853
0.412	6.921
0.412	7.528
0.492	8.642
0.492	8.777
0.492	9.013
0.492	9.553
0.496	6.720
0.496	7.158
0.496	7.260
0.496	7.428
0.496	7.833
0.496	7.867
0.496	8.002
0.496	8.137
0.501	7.698
0.571	7.092
0.571	8.610
0.576	7.328
0.576	7.565
0.576	7.666
0.576	7.733
0.576	7.868
0.576	9.015
0.576	9.285
0.576	9.487
0.576	9.656
0.576	9.757
0.576	10.195
0.581	7.936
0.581	8.003
0.581	8.037
0.581	8.205
0.585	8.340
0.656	7.229
0.656	9.387
0.656	9.455
0.656	9.488
0.656	9.623
0.656	9.758
0.656	9.960
0.656	10.163
0.656	10.702
0.656	10.871
0.656	11.242
0.660	8.342
0.660	9.185
0.660	9.252
0.665	8.746
0.665	9.084
0.735	9.119
0.735	9.254
0.735	9.355
0.735	10.164
0.735	10.333
0.735	10.569
0.735	10.704
0.740	10.502
0.740	10.805
0.740	10.940
0.740	11.007
0.745	8.276
0.745	9.524
0.745	9.625
0.745	9.793
0.749	7.905
0.749	9.760
0.824	9.086
0.824	9.491
0.824	9.626
0.824	9.660
0.824	10.672
0.829	9.828
0.829	9.896
0.829	10.031
0.829	10.132
0.829	10.199
0.829	11.009
0.829	11.279
0.834	8.817
0.904	8.278
0.904	10.842
0.904	11.044
0.904	11.179
0.904	11.381
0.909	9.155
0.909	9.560
0.909	9.627
0.909	9.762
0.909	9.897
0.909	10.201
0.913	9.425
0.998	7.605
0.998	10.169
0.998	10.708
0.998	10.776
0.998	10.877
0.998	10.944
0.998	11.079
0.998	11.079
1.002	9.157
1.002	9.359
1.002	11.417
1.082	10.001
1.087	9.900
1.087	10.170
1.087	10.271
1.087	10.440
1.087	10.710
1.087	10.845
1.087	10.946
1.087	11.081
1.087	11.384
1.087	12.059
1.091	9.496
1.091	9.698
1.166	9.902
1.166	10.138
1.166	10.306
1.166	10.408
1.166	10.779
1.166	12.026
1.166	12.465
1.171	10.475
1.171	10.644
1.171	11.217
1.171	11.689
1.171	11.858
1.241	12.500
1.251	10.173
1.251	10.443
1.251	11.960
1.251	12.129
1.251	12.399
1.255	10.949
1.255	11.117
1.255	11.218
1.255	13.411
1.260	11.387
1.335	12.063
1.335	12.603
1.335	12.839
1.335	12.872
1.335	13.142
1.340	11.658
1.340	11.760
1.340	13.007
1.410	13.278
1.419	14.257
1.424	11.930
1.424	12.132
1.424	13.009
1.494	14.561
1.504	13.550
1.504	13.685
1.508	13.145
1.508	13.314
1.578	12.371
1.578	13.079
1.578	13.180
1.578	13.382
1.578	13.416
1.578	13.484
1.578	13.585
1.578	13.686
1.588	14.799
1.593	14.327
1.658	14.733
1.658	14.901
1.663	12.372
1.663	12.541
1.663	12.743
1.663	14.463
1.663	14.598
1.672	13.080
1.672	13.519
1.742	13.115
1.747	14.296
1.752	13.453
1.752	13.588
1.752	13.723
1.752	13.858
1.752	13.925
1.752	14.869
1.822	13.150
1.831	13.454
1.831	13.589
1.831	13.690
1.831	13.724
1.831	14.297
1.841	14.500
1.841	14.567
1.841	14.668
1.841	14.770
1.841	14.972
1.911	14.636
1.911	14.703
1.911	15.209
1.916	12.343
1.916	12.815
1.916	13.523
1.916	13.793
1.916	14.366
1.986	14.536
1.986	14.705
1.986	14.806
1.991	12.175
1.991	14.233
1.991	14.941
1.995	12.647
1.995	14.907
1.995	15.042
2.009	13.896
2.070	13.559
2.080	13.661
2.080	13.796
2.080	13.863
2.080	14.234
2.080	14.403
2.080	14.639
2.084	15.718
2.089	14.875
2.159	14.775
2.159	14.944
2.159	14.977
2.159	15.213
2.169	13.460
2.169	13.595
2.169	13.932
2.169	14.236
2.169	14.370
2.244	15.417
2.244	15.552
2.248	13.056
2.248	13.225
2.248	13.360
2.248	13.495
2.248	13.495
2.248	13.900
2.248	14.372
2.248	14.675
2.248	14.777
2.328	14.002
2.328	14.508
2.333	15.115
2.333	15.452
2.333	15.823
2.407	13.869
2.412	14.442
2.412	14.543
2.412	15.117
2.426	16.061
2.492	14.511
2.496	14.781
2.501	16.332
2.576	15.052
2.581	15.524
2.581	15.895
2.660	15.289
2.665	15.323
2.665	16.133
2.740	15.223
2.745	16.067
2.749	15.460
2.829	15.461
2.843	16.102
2.904	15.428
2.909	16.204
2.998	15.329
3.012	16.341
3.110	16.241
3.171	16.107
3.246	15.839
3.354	16.009];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.25); % covert a to d
n = size(data.tL,1);
for i=2:n % make sure that all times are unique
  if data.tL(i,1)<= data.tL(i-1,1)
     data.tL(i,1) = max(data.tL(i-1,1),data.tL(i,1)) + 1;
  end
end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastCubi2010';
  comment.tL = 'temp in C is assumed to vary between 4 and 20 C as: 12+8*sin((t + 150)/365*2*pi)';

 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                                 
%% Links
metaData.links.id_CoL = '52W72'; % Cat of Life
metaData.links.id_ITIS = '615818'; % ITIS
metaData.links.id_EoL = '49672948'; % Ency of Life
metaData.links.id_Wiki = 'Strangomera_bentincki'; % Wikipedia
metaData.links.id_ADW = 'Strangomera_bentincki'; % ADW
metaData.links.id_Taxo = '323429'; % Taxonomicon
metaData.links.id_WoRMS = '282909'; % WoRMS
metaData.links.id_fishbase = 'Strangomera-bentincki'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Strangomera_bentincki}}';  
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
bibkey = 'CastCubi2010'; type = 'Article'; bib = [ ...  
'author = {Claudio Castillo-Jord\''{a}n and Luis A. Cubillos and Eduardo Navarro}, ' ...
'year = {2010}, ' ...
'title = {Inter-cohort growth rate changes of common sardine (\emph{Strangomera bentincki}) and their relationship with environmental conditions off central southern {C}hile}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = 105, '...
'pages = {228-236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Strangomera-bentincki.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
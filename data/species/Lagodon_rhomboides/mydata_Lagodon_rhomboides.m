function [data, auxData, metaData, txtData, weights] = mydata_Lagodon_rhomboides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Lagodon_rhomboides'; 
metaData.species_en = 'Pinfish'; 

metaData.ecoCode.climate = {'MB','Cfa'};
metaData.ecoCode.ecozone = {'MAW','MAg','THn'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd', 'jiFe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 18]; 

%% set data
% zero-variate data

data.am = 8*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'Nels2002';   
  temp.am = C2K(18.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.1;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
  comment.Li = 'fishesoftexas gives 25 cm, Wiki 11.4 cm';

data.Wwb = 5.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.02 mm: pi/6*.102^3';
data.Wwp = 34.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01380*Lp^3.04, see F1';
data.Wwi = 1.02e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.04, see F1; fishbase gives 1.5 kg';

data.Ri  = 9e4/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), std length (cm)
0.458	8.453
0.490	10.650
0.510	7.876
0.510	7.472
0.510	7.183
0.510	6.836
0.563	11.635
0.573	12.618
0.615	8.631
0.625	7.128
0.646	7.822
0.656	10.250
0.677	13.604
0.708	12.795
0.729	14.183
0.729	10.831
0.740	13.663
0.740	11.871
0.760	8.577
0.771	7.421
0.792	12.913
0.802	12.740
0.813	7.943
0.833	13.724
0.854	8.869
0.865	10.835
0.865	9.794
0.865	9.678
0.875	12.164
0.875	7.656
0.906	11.009
0.917	13.264
0.917	12.512
0.927	14.594
0.938	8.871
0.938	7.311
0.969	13.670
0.990	10.838
1.000	12.573
1.021	11.648
1.083	14.598
1.083	7.315
1.094	9.512
1.104	15.235
1.115	8.876
1.115	12.229
1.135	8.877
1.156	10.785
1.156	7.722
1.167	10.092
1.177	11.422
1.229	13.909
1.229	11.423
1.260	14.488
1.292	13.043
1.292	15.182
1.313	13.853
1.313	9.865
1.313	9.749
1.323	10.501
1.333	13.334
1.354	6.687
1.365	12.525
1.365	8.595
1.365	9.230
1.438	15.418
1.448	11.025
1.458	17.268
1.490	14.552
1.500	15.766
1.500	16.807
1.500	13.801
1.500	12.298
1.510	10.853
1.521	14.437
1.521	12.299
1.552	15.768
1.552	12.762
1.573	15.017
1.583	15.480
1.594	12.763
1.604	14.093
1.656	13.921
1.656	13.401
1.667	13.054
1.677	16.985
1.688	17.159
1.688	15.425
1.708	16.119
1.708	14.847
1.740	14.328
1.740	15.947
1.750	20.860
1.750	13.230
1.760	15.832
1.771	16.063
1.781	16.584
1.802	14.099
1.813	15.255
1.823	21.151
1.823	15.487
1.854	20.285
1.854	17.857
1.854	14.794
1.865	18.609
1.865	18.609
1.875	20.228
1.875	14.159
1.885	18.205
1.896	21.616
1.896	14.506
1.927	17.744
1.927	17.570
1.927	17.339
1.937	13.062
1.948	14.739
1.958	19.132
1.969	19.132
1.969	16.589
1.979	18.381
1.979	12.774
1.990	19.538
2.000	13.931
2.021	13.527
2.031	17.920
2.042	11.678
2.042	12.545
2.125	12.316
2.135	10.756
2.156	10.063
2.187	11.220
2.187	9.485
2.187	13.879
2.187	14.341
2.229	11.394
2.240	13.071
2.240	11.684
2.240	10.816
2.250	12.666
2.260	16.366
2.271	12.378
2.281	10.760
2.292	13.304
2.302	15.732
2.302	15.269
2.302	13.535
2.302	11.685
2.302	11.570
2.302	9.489
2.323	13.940
2.354	18.797
2.354	19.779
2.365	14.635
2.365	14.173
2.385	14.867
2.406	17.584
2.427	18.683
2.448	15.678
2.448	16.487
2.490	15.217
2.490	17.124
2.490	17.876
2.521	18.166
2.531	17.125
2.552	15.565
2.573	16.144
2.594	14.815
2.604	18.688
2.719	16.322
2.719	15.628
2.802	17.596
2.802	18.232
2.813	13.319
2.823	14.128
2.823	14.937
2.833	15.227
2.844	20.776
2.844	21.123
2.854	20.141
2.854	20.198
2.854	21.933
2.854	16.152
2.865	18.580
2.865	13.898
2.927	17.946
2.938	19.449
2.969	14.479
3.250	14.661
3.250	15.065
3.250	15.354
3.260	13.967
3.260	15.586
3.271	15.817
3.271	16.049
3.271	16.511
3.271	17.609
3.323	13.565
3.354	20.849
3.354	20.328
3.438	15.475
3.458	17.268
3.469	16.112
3.469	14.725
3.479	16.922
3.500	15.766
3.510	18.079
3.510	17.732
3.552	16.693
3.573	16.867
3.573	16.404
3.615	17.272
3.688	20.396
3.740	15.947
3.750	15.427
3.823	15.487
3.823	16.122
3.844	21.672
3.865	18.551
3.865	19.823
3.865	20.979
3.875	22.367
3.875	23.176
3.896	17.049
3.917	21.732
3.948	18.785
4.271	15.962
4.271	17.176
4.271	17.465
4.281	15.673
4.542	17.357
4.708	16.437
4.740	17.363
4.813	16.209
4.844	23.146
4.854	16.730
4.875	22.049
4.948	16.444
5.240	16.048
5.240	16.568
5.260	17.089
5.271	17.609
5.833	23.232
5.854	21.672
6.250	17.464
6.250	16.828
6.844	25.689
6.854	23.262
6.854	24.765
7.854	23.117]; 
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.09; % convert fork length to total length from photo
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Nels2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01380*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6NTVN'; % Cat of Life
metaData.links.id_ITIS = '169187'; % ITIS
metaData.links.id_EoL = '46580002'; % Ency of Life
metaData.links.id_Wiki = 'Lagodon_rhomboides'; % Wikipedia
metaData.links.id_ADW = 'Lagodon_rhomboides'; % ADW
metaData.links.id_Taxo = '42266'; % Taxonomicon
metaData.links.id_WoRMS = '159249'; % WoRMS
metaData.links.id_fishbase = 'Lagodon-rhomboides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagodon_rhomboides}}';
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
bibkey = 'Nels2002'; type = 'article'; bib = [ ...  
'author = {Gary A. Nelson}, ' ...
'year = {2002}, ' ...
'title  = {Age, growth, mortality, and distribution of pinfish (\emph{Lagodon rhomboides}) in {T}ampa {B}ay and adjacent {G}ulf of {M}exico waters}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {100}, ' ...
'pages = {582-592}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lagodon-rhomboides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishesoftexas.org/taxa/lagodon-rhomboides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


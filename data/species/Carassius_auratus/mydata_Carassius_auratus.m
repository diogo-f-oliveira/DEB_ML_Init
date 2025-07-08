  function [data, auxData, metaData, txtData, weights] = mydata_Carassius_auratus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Carassius_auratus'; 
metaData.species_en = 'Goldfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 08 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 10]; 

%% set data
% zero-variate data
data.ab = 2;      units.ab = 'd';  label.ab = 'age at birth'; bibkey.ab = 'OrteReye2006';
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 41*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 48;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from egg diameter of 1 mm of Carassius_carassius : pi/6*0.1^3';
data.Wwp = 37.2;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'OrteReye2006';
data.Wwi = 1.5e3;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.00, F1; EoL gives 2.4 kg';

data.Ri = 63.44*1.5e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'OrteReye2006';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 63.44 egg/g';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.212	7.839
0.323	9.246
0.367	7.638
0.389	6.533
0.390	9.548
0.401	8.543
0.401	9.849
0.478	8.342
0.478	8.744
0.479	9.749
0.523	12.663
0.557	13.367
0.568	14.070
0.612	11.457
0.612	12.362
0.656	11.859
0.679	14.171
0.712	11.357
0.734	14.673
0.745	11.055
0.745	12.161
0.745	12.965
0.745	14.070
0.801	13.266
0.801	13.769
0.801	14.271
0.801	15.176
0.812	11.859
0.833	8.945
0.867	9.950
0.867	10.553
0.889	13.568
0.890	14.171
0.890	14.573
0.911	12.663
0.912	15.276
0.922	9.246
0.934	12.261
0.955	10.854
0.956	11.357
0.956	11.759
0.956	12.764
0.966	10.352
0.967	14.271
0.977	9.950
1.045	15.678
1.056	14.874
1.078	16.281
1.133	12.965
1.134	15.377
1.134	16.281
1.145	14.774
1.166	12.161
1.223	16.181
1.256	15.377
1.277	12.462
1.277	12.965
1.277	13.769
1.278	14.372
1.278	15.176
1.288	11.156
1.288	11.859
1.289	14.774
1.289	15.779
1.310	10.854
1.311	12.764
1.311	16.482
1.321	10.553
1.322	17.186
1.332	9.749
1.332	9.849
1.378	16.985
1.378	17.990
1.389	16.181
1.411	15.578
1.422	14.271
1.422	14.874
1.432	11.055
1.432	12.060
1.433	12.965
1.433	13.568
1.443	10.754
1.455	12.462
1.455	13.367
1.455	13.668
1.466	11.658
1.466	12.060
1.466	16.683
1.477	11.055
1.477	14.874
1.477	15.477
1.477	15.678
1.478	16.482
1.499	10.553
1.499	14.573
1.577	14.171
1.577	14.472
1.588	15.879
1.600	16.683
1.600	17.085
1.632	14.271
1.632	14.472
1.632	15.075
1.633	15.779
1.633	16.884
1.633	17.688
1.633	18.392
1.711	21.709
1.721	15.176
1.722	16.985
1.722	19.899
1.722	20.201
1.722	20.905
1.744	18.191
1.788	19.296
1.789	19.799
1.799	15.176
1.811	20.302
1.811	21.910
1.832	16.583
1.867	21.508
1.888	17.990
1.888	18.693
1.888	19.397
1.888	20.201
1.889	20.603
1.889	21.206
1.889	21.508
1.889	22.312
1.899	17.487
1.989	22.211
2.000	21.809
2.065	17.688
2.065	18.090
2.066	18.693
2.066	19.497
2.066	20.101
2.066	20.503
2.066	21.106
2.066	22.312
2.066	22.613
2.132	17.286
2.143	18.191
2.143	18.794
2.155	21.809
2.155	23.920
2.165	19.397
2.166	20.101
2.166	20.603
2.166	21.106
2.210	22.513
2.210	22.915
2.211	23.719
2.211	24.623
2.211	25.327
2.220	17.286
2.221	17.889
2.221	18.492
2.221	18.794
2.221	19.397
2.221	19.799
2.221	21.910
2.222	27.035
2.232	20.402
2.232	20.905
2.232	21.106
2.232	21.608
2.233	26.834
2.298	17.688
2.299	22.613
2.299	23.216
2.299	23.819
2.299	24.422
2.300	25.025
2.300	25.427
2.300	26.131
2.310	19.196
2.310	20.000
2.321	20.402
2.321	20.804
2.321	21.407
2.321	22.111
2.399	23.518
2.399	24.221
2.399	25.729
2.410	21.608
2.410	22.010
2.410	22.412
2.410	23.015
2.410	24.724
2.410	25.126
2.432	20.000
2.432	20.503
2.432	20.804
2.432	21.307
2.487	17.889
2.487	18.291
2.487	19.698
2.487	20.101
2.487	21.106
2.499	22.312
2.521	23.015
2.521	23.618
2.521	24.322
2.553	19.397
2.553	19.497
2.554	19.799
2.554	20.201
2.554	20.503
2.554	21.005
2.554	21.307
2.554	21.809
2.554	22.312
2.554	22.814
2.554	23.417
2.554	24.221
2.554	24.724
2.621	24.523
2.642	19.095
2.642	19.598
2.654	23.116
2.654	23.317
2.676	20.302
2.676	21.206
2.676	21.608
2.676	22.312
2.709	23.015
2.709	23.317
2.710	25.427
2.721	23.920
2.731	22.412
2.743	24.523
2.765	25.025
2.765	26.030
2.831	22.211
2.831	22.814
2.832	26.834
2.843	25.327
2.843	25.829
2.854	24.221
2.854	24.724
2.887	24.824
2.887	25.427
2.887	26.131
2.898	24.322
2.909	23.920
2.910	26.834
2.910	27.538
2.920	22.211
2.920	22.613
2.920	23.116
2.920	23.518
2.976	23.719
2.998	24.523
2.998	25.025
2.998	25.729
2.998	26.231
2.998	26.633
2.998	27.236
3.021	28.241
3.031	23.116
3.031	23.417
3.031	23.920
3.031	24.020
3.031	24.523
3.031	25.025
3.042	25.427
3.054	25.829
3.054	26.231
3.054	26.533
3.054	26.935
3.054	28.141
3.142	25.729
3.142	26.131
3.142	26.734
3.143	27.538
3.143	28.040
3.143	28.543
3.153	24.623
3.165	30.251
3.254	28.543
3.254	29.146
3.254	29.749
3.254	30.352
3.254	31.156
3.264	25.427
3.264	25.930
3.265	27.839
3.275	26.533
3.287	29.246
3.287	29.749
3.287	30.553
3.298	27.236
3.298	27.940
3.298	28.744
3.398	31.055
3.420	27.538
3.420	27.940
3.420	28.442
3.420	28.945
3.420	29.146
3.420	29.749
3.420	30.251
3.431	26.131
3.431	26.633
3.431	27.035
3.464	26.432
3.464	27.940
3.464	28.543
3.464	28.844
3.464	29.146
3.465	29.950
3.465	30.452
3.476	31.055
3.520	29.648
3.553	27.035
3.553	27.538
3.553	28.141
3.553	28.945
3.553	31.256
3.564	30.754
3.575	26.332
3.575	30.050
3.631	29.045
3.631	29.548
3.631	31.357
3.652	27.236
3.719	27.337
3.731	30.151
3.775	32.161
3.786	31.357
3.797	30.754
3.808	29.648
3.808	30.050
3.819	28.543
3.819	29.146
3.830	27.739
3.897	28.241
3.897	28.643
3.908	29.146
3.919	29.648
3.919	30.251
3.919	30.754
3.919	31.457
3.919	31.759
3.919	32.060
3.920	32.462
3.920	33.065
3.975	33.769
3.986	29.950
3.997	31.457
3.997	32.060
3.997	32.462
3.997	33.166
4.008	30.251
4.008	30.854
4.030	32.060
4.030	32.462
4.031	33.367
4.041	31.558
4.052	28.442
4.052	28.744
4.052	29.347
4.063	30.653
4.063	31.055
4.096	30.251
4.097	31.156
4.097	31.859
4.141	33.065
4.152	30.553
4.152	30.955
4.152	31.457
4.152	31.759
4.152	32.362
4.153	33.668
4.153	34.171
4.218	30.151
4.230	31.256
4.241	31.960
4.241	32.462
4.241	32.663
4.252	33.568
4.252	33.869
4.308	32.663
4.308	33.166
4.318	31.256
4.319	32.060
4.319	33.568
4.319	34.472
4.396	32.965
4.396	33.467
4.397	34.070
4.397	34.372
4.397	35.176
4.407	32.060
4.418	31.558
4.429	31.156
4.474	31.558
4.474	32.261
4.474	32.764
4.474	33.166
4.474	34.774
4.474	35.176
4.485	33.467
4.485	33.970
4.485	34.372
4.563	33.568
4.563	34.070
4.563	34.372
4.563	35.176
4.640	33.266
4.652	34.372
4.652	35.377
4.662	32.261
4.740	32.462
4.740	35.276
4.829	35.377
4.840	33.266
4.840	34.372
4.840	34.573
4.851	32.864
4.851	35.980
4.852	36.884
4.862	33.769
4.896	36.985
4.917	33.467
4.918	35.477
4.918	35.980
4.940	34.573
4.984	34.271
4.985	36.482
5.007	37.085
5.040	34.874
5.051	35.176
5.074	37.889
5.084	33.769
5.084	34.372
5.084	35.980
5.084	36.884
5.106	35.377
5.139	34.673
5.140	34.975
5.140	36.382
5.228	36.181
5.239	34.975
5.261	34.171
5.284	36.482
5.317	36.281
5.317	37.286
5.361	34.975
5.384	35.678
5.406	36.784
5.406	37.387
5.428	36.482
5.473	37.387
5.494	35.578
5.494	35.578
5.506	37.889
5.539	37.588
5.550	35.075
5.583	36.281
5.583	36.683
5.583	37.286
5.650	37.085
5.705	36.382
5.816	37.789
5.905	37.387
6.238	37.487
6.493	40.704];
data.tL(:,1) = 365 * (0.4 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LoreCorb2007';
comment.tL = 'mean temperature is guessed';

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
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'The high maintenance, compared to other family members, is probably linked to farming selection, to boost production';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1', F1); 

%% Links
metaData.links.id_CoL = '68ZXN'; % Cat of Life
metaData.links.id_ITIS = '163350'; % ITIS
metaData.links.id_EoL = '214363'; % Ency of Life
metaData.links.id_Wiki = 'Carassius_auratus'; % Wikipedia
metaData.links.id_ADW = 'Carassius_auratus'; % ADW
metaData.links.id_Taxo = '43892'; % Taxonomicon
metaData.links.id_WoRMS = '154298'; % WoRMS
metaData.links.id_fishbase = 'Carassius-auratus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carassius_auratus}}';  
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
bibkey = 'LoreCorb2007'; type = 'Incollection'; bib = [ ...  
'doi = {10.1007/978-1-4020-6029-8_13}, ' ...
'author = {Massimo Lorenzoni and Massimiliano Corboli and Lucia Ghetti and Giovanni Pedicillo and Antonella Carosi}, ' ...
'year = {2007}, ' ...
'title = {Growth and reproduction of the goldfish \emph{Carassius auratus}: a case study from {I}taly}, ' ... 
'booktitle = {Biological Invaders in Inland Waters}, ' ...
'editor = {Gherardi}, ' ...
'volume = {ch13}, '...
'pages = {259-274}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrteReye2006'; type = 'article'; bib = [ ...  
'author = {A.A. Ortega-Salas1 and H. Reyes-Bustamante}, ' ...
'year = {2006}, ' ...
'title = {Initial sexual maturity and fecundity of the goldfish \emph{Carassius auratus} ({P}erciformes: {C}yprynidae) under semi-controlled conditions}, ' ... 
'journal = {Rev. Biol. Trop. (Int. J. Trop. Biol. ISSN-0034-7744)}, ' ...
'volume = {54(4)}, '...
'pages = {1113-1116}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Carassius-auratus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/214363}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


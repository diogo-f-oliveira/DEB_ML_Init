function [data, auxData, metaData, txtData, weights] = mydata_Coris_julis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Coris_julis'; 
metaData.species_en = 'Mediterranean rainbow wrasse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 09]; 

%% set data
% zero-variate data

data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.8;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AlonAlos2014'; 
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 9.2;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'GordMoli2000','fishbase'};
  comment.Wwp = 'based on 0.012*Lp^2.910, see F1';
data.Wwi = 238;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'GordMoli2000','fishbase'};
  comment.Wwi = 'based on 0.012*Li^2.910, see F1';

% univariate data
data.tL = [ ... % time since birth (yr), total length (cm) 
0.044	5.999
0.058	6.414
0.058	6.451
0.058	6.489
0.072	7.017
0.151	6.072
0.151	6.072
0.152	6.412
0.152	6.412
0.180	7.393
0.206	7.052
0.206	7.052
0.325	5.956
0.417	5.011
0.524	5.009
0.565	5.385
0.890	7.040
0.890	7.492
1.080	8.545
1.171	7.110
1.174	8.921
1.322	9.446
1.323	9.937
1.323	9.937
1.335	8.918
1.335	8.918
1.361	8.502
1.387	8.011
1.723	8.382
1.925	8.907
1.925	8.907
1.925	8.907
1.925	8.907
1.925	8.907
1.926	9.473
1.926	9.473
1.926	9.473
1.951	8.491
1.951	8.491
1.951	8.491
1.951	8.491
1.951	8.491
2.088	10.413
2.142	10.450
2.170	11.129
2.170	11.468
2.171	11.921
2.290	10.938
2.291	11.541
2.291	11.541
2.302	9.956
2.327	8.975
2.730	9.910
2.731	10.477
2.731	10.477
2.733	11.533
2.733	11.609
2.893	10.813
2.893	10.813
2.893	10.813
2.893	10.813
2.893	10.813
2.893	10.813
2.893	10.813
2.894	11.379
2.894	11.379
2.894	11.379
2.894	11.379
2.903	8.964
2.905	10.360
2.905	10.360
2.905	10.360
2.906	10.813
2.917	9.416
2.917	9.416
2.918	9.831
2.918	9.831
2.918	9.831
2.918	9.831
2.919	10.360
2.921	12.020
2.921	12.020
3.070	12.432
3.085	13.526
3.257	12.089
3.257	12.089
3.267	10.466
3.267	10.466
3.267	10.466
3.268	10.995
3.269	11.410
3.270	12.315
3.270	12.315
3.310	12.013
3.310	12.013
3.325	12.956
3.325	12.956
3.326	13.371
3.326	13.409
3.327	13.937
3.327	13.937
3.338	12.427
3.338	12.427
3.481	10.085
3.510	11.481
3.645	11.969
3.754	12.948
3.755	13.929
3.914	12.303
3.914	12.416
3.914	12.416
3.914	12.416
3.914	12.869
3.915	12.945
3.915	13.473
3.917	14.077
3.917	14.077
3.928	12.982
3.944	14.454
3.944	14.454
3.953	11.963
3.953	11.963
4.250	13.467
4.252	14.146
4.263	13.014
4.263	13.051
4.333	14.484
4.334	15.050
4.478	13.010
4.478	13.010
4.478	13.349
4.478	13.349
4.484	16.934
4.489	12.028
4.494	15.047
4.502	11.462
4.893	12.889
4.908	13.907
4.908	13.907
4.910	14.926
4.922	14.511
4.922	14.511
4.923	14.926
5.164	14.921
5.165	15.525
5.511	14.009
5.848	14.946
5.877	16.455
6.482	17.425
6.812	14.852
6.813	15.456
6.813	15.456
6.841	15.984
7.834	16.871
7.837	18.456];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordMoli2000';

% length-fecundity
data.LN = [ ...
9.884	2742.268
9.895	2659.794
9.917	3072.165
10.100	2432.990
10.293	4103.093
10.401	3134.021
10.595	3216.495
10.595	2247.423
10.659	2061.856
10.692	2226.804
10.703	3835.052
10.886	3010.309
10.886	3195.876
10.896	3793.814
10.993	3979.381
11.004	2123.711
11.004	2577.320
11.090	2804.124
11.176	3154.639
11.176	2639.175
11.209	3793.814
11.209	3670.103
11.306	2989.691
11.316	5422.680
11.392	4948.454
11.510	2536.082
11.510	3731.959
11.596	2742.268
11.596	2969.072
11.596	2412.371
11.607	3814.433
11.607	4969.072
11.672	2494.845
11.682	3670.103
11.693	3257.732
11.693	4206.186
11.801	3443.299
11.812	5567.010
11.898	4226.804
11.930	3814.433
11.930	3422.680
11.930	3072.165
11.973	2164.948
11.984	4494.845
11.995	4185.567
11.995	3278.351
12.092	2288.660
12.102	4123.711
12.102	6597.938
12.188	2804.124
12.199	4226.804
12.285	3855.670
12.382	2515.464
12.393	3525.773
12.511	4804.124
12.587	3154.639
12.598	4989.691
12.684	2329.897
12.705	3896.907
12.705	4907.216
12.813	2948.454
13.093	7237.113
13.093	9072.165
13.179	7835.052
13.394	6536.082
13.405	5216.495
13.416	3752.577
13.534	5773.196
13.674	4783.505
13.696	8989.691
13.814	4103.093
15.192	10247.423
15.688	9010.309];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(19);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'AlonAlos2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.kap = 5 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length weight: Ww in g = 0.012*(TL in cm)^2.910';
metaData.bibkey.F1 = 'GordMoli2000'; 
F2 = 'Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'YFCT'; % Cat of Life
metaData.links.id_ITIS = '170676'; % ITIS
metaData.links.id_EoL = '46571633'; % Ency of Life
metaData.links.id_Wiki = 'Coris_julis'; % Wikipedia
metaData.links.id_ADW = 'Coris_julis'; % ADW
metaData.links.id_Taxo = '46338'; % Taxonomicon
metaData.links.id_WoRMS = '126963'; % WoRMS
metaData.links.id_fishbase = 'Coris-julis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coris_julis}}';
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
bibkey = 'GordMoli2000'; type = 'Article'; bib = [ ... 
'author = {Ana Gordoa and Balbina Mol\''{i} and Nuria Ravent\''{o}s}, ' ... 
'year = {2000}, ' ...
'title = {Growth performance of four wrasse species on the north-western {M}editerranean coast}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {45}, ' ...
'pages = {43-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlonAlos2014'; type = 'Article'; bib = [ ... 
'doi = {10.12681/mms.455}, ' ...
'author = {A. Alonso-Fern\''{a}dez and J. Al\''{o}sand M. Palmer}, ' ... 
'year = {2014}, ' ...
'title = {Variability in reproductive traits in the sex-changing fish, \emph{Coris julis}, in the {M}editerranean}, ' ...
'journal = {Mediterranean Marine Science}, ' ...
'volume = {15}, ' ...
'pages = {106-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coris-julis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


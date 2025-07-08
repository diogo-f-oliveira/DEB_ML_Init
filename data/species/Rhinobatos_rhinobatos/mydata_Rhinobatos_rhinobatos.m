function [data, auxData, metaData, txtData, weights] = mydata_Rhinobatos_rhinobatos

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinobatidae';
metaData.species    = 'Rhinobatos_rhinobatos'; 
metaData.species_en = 'Common guitarfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 01 03];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 03]; 

%% set data
% zero-variate data;
data.ab = 9*30.5;units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'IsmeYigi2007';    
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4 to 9 mnth';
data.ap = 5*365;  units.ap = 'd';   label.ap = 'age at puberty';           bibkey.ap = 'IsmeYigi2007';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 7*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'IsmeYigi2007';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 25.7;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'IsmeYigi2007';
data.Lp  = 67;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'IsmeYigi2007';
data.Li  = 147;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'IsmeYigi2007';

data.Wwb = 48.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'IsmeYigi2007';
 comment.Wwb = 'estimate based on Wwb = Wwi * (Lb/Li)^3';

data.Ri  = 9/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 10 pups per yr';
  
% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (0.1*yr), total length (cm)
0.049	44.872
0.095	22.172
0.097	23.492
0.098	24.548
0.099	25.867
0.111	36.161
0.113	38.009
0.115	39.857
0.116	41.177
0.246	29.299
0.246	29.827
0.247	30.355
0.248	31.147
0.248	31.675
0.248	31.675
0.250	33.523
9.953	45.447
9.955	47.559
9.970	61.284
9.970	61.284
9.972	63.132
10.027	48.351
10.032	52.838
10.033	53.630
10.033	53.894
10.034	54.950
10.035	56.005
10.038	58.645
10.039	58.909
10.040	60.493
10.040	60.493
10.099	48.879
10.099	49.143
10.100	49.935
10.106	55.214
20.023	68.459
20.024	69.515
20.025	69.779
20.025	70.307
20.026	70.835
20.027	71.890
20.027	72.154
20.028	72.946
20.106	79.018
20.111	83.769
20.150	53.942
20.155	59.221
30.101	98.334
30.156	83.289
30.217	74.315
30.221	77.482
30.223	79.330
40.090	111.843
50.074	120.338];
data.tL(:,1) = 36.5 * data.tL(:,1); % convert 0.1*yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IsmeYigi2007';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
21.881	38.424
22.252	68.397
22.993	68.344
24.291	48.252
24.291	38.252
25.404	38.172
26.887	68.066
28.000	77.987
29.854	87.854
30.411	77.815
32.265	77.682
32.821	147.642
33.192	97.616
34.490	157.523
34.861	107.497
36.159	97.404
36.530	177.378
37.642	87.298
37.828	197.285
39.126	157.192
40.795	157.073
40.795	267.073
42.093	256.980
42.834	206.927
43.576	176.874
44.132	286.834
45.616	316.729
45.616	216.729
47.285	216.609
47.841	236.570
48.212	336.543
48.397	376.530
49.881	406.424
50.623	296.371
50.623	366.371
50.993	426.344
52.291	476.252
53.219	366.185
53.219	336.185
53.589	516.159
54.702	436.080
54.702	516.080
55.073	356.053
56.185	535.974
56.556	405.947
57.854	625.854
58.040	435.841
58.040	525.841
58.967	635.775
59.338	445.748
59.894	505.709
60.450	655.669
61.007	535.629
61.748	715.576
62.119	525.550
62.305	725.536
62.490	605.523
62.861	765.497
63.417	625.457
63.603	705.444
63.974	825.417
65.272	665.325
65.272	775.325
67.497	905.166
68.609	835.086
68.795	1015.073
69.166	915.046
70.649	834.940
70.834	954.927
71.762	1104.861
72.689	954.795
73.245	994.755
73.430	1224.742
74.728	1064.649
77.881	1114.424
78.437	1294.384
78.437	1424.384
80.291	1474.252
81.219	1394.185
81.404	1284.172
81.960	1364.133
82.887	1634.066
83.815	1664.000
84.371	1753.960
95.311	2473.179
97.536	2763.020
111.815	3492.000
119.603	4551.444];
units.LW = {'d', 'g'};  label.LW = {'total length','wet weight', };  
bibkey.LW = 'IsmeYigi2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S7XM'; % Cat of Life
metaData.links.id_ITIS = '160819'; % ITIS
metaData.links.id_EoL = '46560660'; % Ency of Life
metaData.links.id_Wiki = 'Rhinobatos_rhinobatos'; % Wikipedia
metaData.links.id_ADW = 'Rhinobatos_rhinobatos'; % ADW
metaData.links.id_Taxo = '42034'; % Taxonomicon
metaData.links.id_WoRMS = '105898'; % WoRMS
metaData.links.id_fishbase = 'Rhinobatos-rhinobatos'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhinobatos_rhinobatos}}'; 
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
bibkey = 'IsmeYigi2007'; type = 'Article'; bib = [ ...  
'author = {Ali Ismen and Cigdem Y{\i}g{\i}n and P{\i}nar Ismen}, ' ...
'year = {2007}, ' ...
'title  = {Age, growth, reproductive biology and feed of the common guitarfish (\emph{Rhinobatos rhinobatos} {L}innaeus, 1758) in {I}skenderun {B}ay, the eastern {M}editerranean {S}ea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {84}, ' ...
'pages = {263-269}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Rhinobatos-rhinobatos.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
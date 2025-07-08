function [data, auxData, metaData, txtData, weights] = mydata_Katharina_tunicata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Polyplacophora'; 
metaData.order      = 'Chitonida'; 
metaData.family     = 'Mopaliidae';
metaData.species    = 'Katharina_tunicata'; 
metaData.species_en = 'Black Katy chiton'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 21]; 

%% set data
% zero-variate data

data.am = 17*365; units.am = 'd';    label.am = 'life span';           bibkey.am = 'Lord2012';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'in view of growth at 12 yr, life span is likely to be underestimated';

data.Lp  = 3.25;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Lepidochitona_cinerea: 0.6*13/2.4)'; 
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate length'; bibkey.Li  = 'sealifebase';

data.Wwb = 4.2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 160-200 mum for Lepidochitona_cinerea:  pi/6*0.02^3';
data.Wwj = 4.3e-6;  units.Wwj = 'g'; label.Wwj = 'wet weight at birth'; bibkey.Wwj = 'guess';
  comment.Wwj = 'Based on settlement following a few hours after hatching';

data.Ri  = 8.7e5/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for yearly fecundity of Lepidochitona_cinerea: (11/1.4)^3*1.8e3';

% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), length (cm)
2.082	4.198
3.080	5.725
3.080	5.293
3.080	5.064
4.021	6.667
4.021	5.600
4.021	5.447
4.991	9.593
4.991	8.601
5.048	6.796
5.077	6.415
5.989	7.484
6.018	8.094
6.018	7.865
6.075	8.882
7.016	10.409
7.016	10.231
7.986	10.055
7.986	8.708
8.014	10.818
8.014	8.911
8.043	9.470
9.012	10.794
9.012	8.989
9.041	9.802
9.098	9.497
10.039	10.541
10.039	10.821
11.009	11.102
11.950	10.366
12.036	10.189
12.492	11.257
16.000	10.347
17.055	10.552];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Lord2012';

% time-weight data
data.tWw = [ ... % time since birth (yr), volume (ml)
2.053	4.764
2.995	9.540
2.995	12.597
3.993	8.881
4.021	12.279
4.078	6.505
5.020	50.007
5.020	35.400
5.020	22.152
5.105	14.340
5.961	26.927
6.018	48.670
6.018	45.612
6.018	30.665
7.045	35.103
7.073	59.223
7.986	50.410
8.014	87.098
8.014	60.262
8.014	37.502
8.043	62.640
9.012	60.283
9.012	64.699
9.041	41.940
9.041	50.772
9.982	75.251
10.039	70.156
11.066	90.900
12.064	86.165
12.064	74.955
12.093	96.017
12.520	98.404
16.029	85.230
17.055	120.921];
data.tWw(:,1) = data.tWw(:,1)*365; % convert yr to d
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(16);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Lord2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'A plaktonic stage of only a few hours is assumed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'No sexual dimorphism';
metaData.bibkey.F1 = 'Lord2012';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R3RS'; % Cat of Life
metaData.links.id_ITIS = '78979'; % ITIS
metaData.links.id_EoL = '450283'; % Ency of Life
metaData.links.id_Wiki = 'Katharina_tunicata'; % Wikipedia
metaData.links.id_ADW = 'Katharina_tunicata'; % ADW
metaData.links.id_Taxo = '132772'; % Taxonomicon
metaData.links.id_WoRMS = '386338'; % WoRMS
metaData.links.id_molluscabase = '386338'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Katharina_tunicata}}';
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
bibkey = 'Lord2012'; type = 'Article'; bib = [ ...
'doi = {10.4002/040.055.0104}, ' ...
'author = {Joshua P. Lord}, ' ... 
'year = {2012}, ' ...
'title = {Longevity and growth rates of the gumboot chiton \emph{Cryptochiton stelleri}, and the black leather chiton, \emph{Katharina tunicata}}}, ' ...
'journal = {Malacologia}, ' ...
'volume = {55}, ' ...
'number = {1}, ' ...
'pages = {43-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Katharina-tunicata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


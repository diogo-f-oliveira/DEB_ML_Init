function [data, auxData, metaData, txtData, weights] = mydata_Cumberlandia_monodonta

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Margaritiferidae';
metaData.species    = 'Cumberlandia_monodonta'; 
metaData.species_en = 'Spectacle case pearly mussel'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'};
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 03];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 56*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Baird2000';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Baird2000'; 
  comment.Lp = 'smallest gravid females had 5.6, 7.4 and 7.6 cm shell length';
data.Li  = 18;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Baird2000';

% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
2.816	3.113
2.897	2.774
2.900	3.316
3.068	4.060
3.070	4.466
3.888	3.147
3.896	4.872
3.976	4.432
3.994	8.256
4.636	4.602
4.719	4.703
4.720	4.872
4.879	3.586
4.891	6.192
4.892	6.462
4.965	4.263
5.052	5.414
5.126	3.417
5.800	6.767
5.955	4.635
5.956	4.771
5.960	5.718
6.036	4.365
6.047	6.564
6.050	7.376
6.121	4.906
6.128	6.293
6.135	7.850
6.204	5.008
6.205	5.177
6.207	5.549
6.708	7.105
6.709	7.241
6.867	5.684
6.875	7.444
6.948	5.481
6.949	5.684
6.954	6.699
6.955	6.970
6.958	7.647
6.966	9.338
7.031	5.481
7.033	6.090
7.035	6.429
7.109	4.602
7.109	4.703
7.110	4.737
7.110	4.838
7.111	4.974
7.111	5.075
7.111	5.143
7.112	5.244
7.112	5.346
7.853	5.041
7.854	5.414
7.855	5.583
7.856	5.853
7.859	6.327
7.859	6.462
7.878	10.624
7.944	7.038
7.946	7.376
8.674	4.331
8.678	5.278
8.777	9.000
8.930	6.361
8.931	6.530
8.932	6.733
8.947	10.083
9.008	5.414
9.009	5.617
9.010	5.887
9.011	5.955
9.018	7.613
9.020	7.883
9.094	6.226
9.186	8.256
9.682	8.594
9.838	6.665
9.848	8.729
9.933	9.305
9.935	9.711
9.999	5.786
9.999	5.820
10.004	6.970
10.005	7.139
10.006	7.410
10.021	10.556
10.090	7.647
10.096	9.000
10.111	12.282
10.112	12.485
10.190	11.504
10.855	12.722
10.917	8.289
10.936	12.383
10.995	7.410
10.997	7.680
10.997	7.816
11.004	9.338
11.007	9.947
11.908	8.797
11.909	9.034
11.911	9.305
11.917	10.692
11.981	6.632
11.985	7.579
11.995	9.609
12.641	6.801
12.809	7.410
12.912	11.910
12.915	12.586
13.062	8.662
13.880	7.308
13.968	8.526
14.130	8.019
14.131	8.222
14.787	7.410
15.032	6.936
15.138	12.045
15.795	11.707
15.946	8.628
16.025	7.917
16.031	9.169
16.210	12.180
16.617	11.165
17.124	13.872
17.941	12.316
18.191	12.992
18.840	10.726
18.852	13.195
18.852	13.229
19.254	11.132
19.257	11.673
19.758	13.128
19.762	14.075
19.835	11.876
19.836	12.180
19.837	12.451
19.837	12.485
19.913	11.064
19.915	11.538
20.734	10.252
20.909	12.620
21.068	11.165
21.902	13.398
22.060	11.944
22.965	11.571
22.966	11.707
22.968	12.180
22.981	15.023
23.124	10.252
23.222	13.669
23.960	12.857
23.963	13.432
24.038	11.977
24.040	12.248
24.040	12.350
24.053	15.158
24.119	11.605
24.129	13.703
24.953	13.771
25.113	12.654
25.123	14.786
25.187	10.793
25.859	13.703
25.926	10.184
25.927	10.455
26.016	11.876
26.018	12.383
26.019	12.485
26.840	11.808
27.003	11.470
27.088	12.113
27.244	10.117
27.919	13.466
27.993	11.673
28.089	14.617
28.156	11.335
28.243	12.282
28.986	12.586
29.073	13.635
29.157	13.838
29.802	10.793
29.883	10.421
29.901	14.312
29.973	12.147
30.057	12.350
30.143	13.195
30.155	15.767
30.641	14.008
30.801	12.857
30.958	11.335
31.308	15.665
31.956	13.128
32.863	13.229
32.932	10.421
32.939	11.876
32.956	15.564
33.035	14.820
33.937	13.872
33.941	14.684
34.015	12.789
34.093	11.944
34.910	10.252
35.085	12.519
35.087	13.026
35.108	17.628
35.255	13.737
36.914	15.936
38.135	12.688
38.137	13.195
38.149	15.767
39.049	14.312
39.061	16.951
41.032	15.496
47.132	15.530
47.957	15.733
48.048	17.662
55.051	17.188
55.133	16.985
56.272	13.703];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Baird2000';
comment.tL = 'Data from Gasconade and Meramec Rivers, Missouri; sexes comnied; mean temperature is guessed';

% length - fecundity
data.LN = [ ... % shell length (cm), fecundity (#)
 13.81 3930e3
 12.45 1930e3
 14.84 5730e3
 16.65 4630e3
 19.09 9570e3
 13.90 5030e3];
units.LN = {'cm', '#'}; label.LN = {'shell length', 'fecundity'};  
temp.LN = C2K(17);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Baird2000';
comment.LN = 'Data from Gasconade and Meramec Rivers, Missouri; mean temperature is guessed';


% length - weight
data.LWw = [ ... % shell length (cm), total weight (g)
 13.81 149.0
 12.45  98.4
 14.84 145.0
 16.65 262.5
 19.09 381.3
 13.90 118.5];
units.LWw = {'cm', 'g'}; label.LWw = {'shell length', 'total weight'};  
bibkey.LWw = 'Baird2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Energy conductance is very low, but attemps to increase it affected goodness of fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'no hermaphrodism found';
metaData.bibkey.F1 = 'Baird2000'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BQ49'; % Cat of Life
metaData.links.id_ITIS = '80376'; % ITIS
metaData.links.id_EoL = '51891250'; % Ency of Life
metaData.links.id_Wiki = 'Cumberlandia_monodonta'; % Wikipedia
metaData.links.id_ADW = 'Cumberlandia_monodonta'; % ADW
metaData.links.id_Taxo = '136923'; % Taxonomicon
metaData.links.id_WoRMS = '857533'; % WoRMS
metaData.links.id_molluscabase = '857533'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cumberlandia_monodonta}}';
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
bibkey = 'Baird2000'; type = 'Phdthesis'; bib = [ ...
'author = {Michael S. Baird}, ' ... 
'year = {2000}, ' ...
'title = {Life history of the spectaclecase, \emph{Cumberlandia monodonta} {S}ay, 1829 ({B}ivalvia, {U}nionoidea, {M}argaritiferidae)}, ' ...
'school = {Southwest Missouri State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


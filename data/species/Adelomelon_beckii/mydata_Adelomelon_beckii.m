function [data, auxData, metaData, txtData, weights] = mydata_Adelomelon_beckii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Volutidae';
metaData.species    = 'Adelomelon_beckii'; 
metaData.species_en = 'Beck''s volute'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 02]; 

%% set data
% zero-variate data

data.am = 29*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ArriBrey2011';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.72; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'ArriPenc2018';
data.Lp  = 25.6; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty for female'; bibkey.Lp  = 'ArriPenc2018';
data.Li  = 49.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'Wiki';

data.Wwi = 4.25e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'ArriBrey2011';
  comment.Wwi = 'based on 10^(-4.523+3.025*log10(10*Li)), see F1';

data.Ri  = 830/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.8';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.824	8.367
0.932	4.377
0.933	5.160
0.933	5.707
0.934	6.567
0.969	3.673
1.863	7.660
1.936	6.017
1.936	6.565
2.009	4.609
2.010	5.470
2.051	10.553
2.939	7.110
2.977	7.501
2.977	7.970
2.978	8.674
2.979	9.456
2.980	10.551
2.980	10.942
2.982	13.679
3.947	12.347
4.017	8.515
4.060	14.459
4.091	8.045
4.130	9.766
4.131	10.783
4.131	11.252
4.875	12.971
4.876	13.987
4.879	17.272
4.909	9.060
4.986	12.345
5.171	11.562
5.917	15.080
5.918	16.253
5.953	13.593
5.956	17.817
5.987	10.152
6.063	12.889
6.920	16.328
6.921	16.954
7.028	11.870
7.033	17.892
7.034	18.440
7.813	18.438
7.924	17.342
7.958	13.979
7.998	16.795
8.002	21.488
9.005	21.954
9.036	15.854
9.074	16.401
9.076	18.982
9.114	19.608
9.854	16.477
9.859	22.265
9.894	19.918
9.894	20.466
9.934	23.047
10.861	22.028
11.009	21.401
11.044	19.290
11.086	24.373
11.939	23.511
11.940	24.919
11.976	22.963
12.048	21.164
12.944	26.793
12.979	23.821
12.979	24.212
12.980	24.447
13.909	25.461
13.909	25.696
13.910	26.712
13.982	24.288
14.985	25.302
14.986	25.927
14.986	26.318
15.062	28.117
15.840	26.473
15.952	27.254
15.953	27.958
15.954	29.288
16.919	28.503
16.955	27.721
17.029	27.173
17.033	31.632
17.922	29.752
17.924	32.099
18.070	29.204
18.107	28.422
19.039	32.408
19.111	30.844
19.967	32.171
19.967	32.954
21.045	33.733
21.192	32.950
21.973	33.496
21.974	34.591
22.903	35.605
23.013	34.041
23.979	35.602
23.981	36.775
25.019	35.991
25.021	37.242
25.948	36.301
25.986	37.631
26.915	38.097
27.100	37.471
27.881	38.486];
units.tL   = {'yr', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArriBrey2011';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: log10(SFWM in g) = -4.523 + 3.025*log10(SL in mm)';
metaData.bibkey.F1 = 'ArriBrey2011';
F2 = 'Feeds mostly on Zidona dufresnii, but also other molluscs';
metaData.bibkey.F2 = 'GimeBrey2004';
F3 = '7-9 embryos per capsule';
metaData.bibkey.F3 = 'ArriPenc2018';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '9XWL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4845768'; % Ency of Life
metaData.links.id_Wiki = 'Adelomelon_beckii'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3939590'; % Taxonomicon
metaData.links.id_WoRMS = '606557'; % WoRMS
metaData.links.id_molluscabase = '606557'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Adelomelon_beckii}}';
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
bibkey = 'ArriBrey2011'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.seares.2010.10.003}, ' ...
'author = {Florencia Arrighetti and Thomas Brey and Andreas Mackensen and Pablo E. Penchaszadeh}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth and mortality in the giant snail \emph{Adelomelon beckii} ({B}roderip 1836) on the {A}rgentinean shelf}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {65}, ' ...
'pages = {219-223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArriPenc2018'; type = 'Article'; bib = [ ... 
'author = {Florencia Arrighetti and Pablo E. Penchaszadeh}, ' ... 
'year = {2018}, ' ...
'title = {Biology and conservation of the giant marine snail \emph{Adelomelon beckii} in {A}rgentina}, ' ...
'journal = {Tentacle}, ' ...
'volume = {26}, ' ...
'pages = {19-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
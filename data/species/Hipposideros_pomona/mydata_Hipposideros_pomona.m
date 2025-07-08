function [data, auxData, metaData, txtData, weights] = mydata_Hipposideros_pomona

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Hipposideridae';
metaData.species    = 'Hipposideros_pomona'; 
metaData.species_en = 'Pomona roundleaf bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 25]; 

%% set data
% zero-variate data

data.tg = 45;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'JinLin2011';
  comment.Wwb = '2.31 g for male, 2.36 g for female';
data.Wwi = 5.89;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'JinLin2011';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'JinLin2011';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litters per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.936	2.239
0.937	2.187
0.938	2.187
0.939	2.081
1.023	2.609
1.024	2.516
1.025	2.398
3.838	2.765
3.839	2.699
3.923	2.871
3.924	2.633
3.925	2.594
4.008	2.475
4.009	2.383
4.094	3.161
4.095	2.976
6.823	3.001
6.907	3.291
6.908	2.935
6.909	2.922
6.910	2.684
6.992	3.436
6.993	3.199
6.994	3.146
6.995	2.803
9.808	3.606
9.891	3.988
9.892	3.804
9.893	3.711
9.894	3.658
9.895	3.460
9.896	3.342
9.979	3.249
10.064	3.513
12.962	4.408
12.963	4.237
12.964	4.105
12.965	3.986
12.966	3.894
12.967	3.867
12.968	3.762
12.969	3.617
15.870	4.486
15.871	4.420
15.872	4.340
15.873	4.248
15.874	4.182
15.875	4.129
15.876	4.063
15.977	4.763
15.978	4.604
16.034	3.958
16.035	3.852
18.848	4.141
18.849	4.246
18.850	4.391
18.851	4.470
18.952	3.995
18.953	4.550
18.954	4.629
18.955	4.655
18.956	4.774
21.748	4.746
21.749	4.640
21.832	5.062
21.833	4.811
21.834	4.548
21.835	4.429
21.836	4.310
21.919	4.205
22.004	4.917
24.818	4.849
24.819	4.955
24.820	4.968
24.902	4.453
24.903	4.546
24.904	4.704
24.905	4.770
24.906	5.073
24.907	5.218
27.808	5.256
27.888	4.913
27.889	4.755
27.890	4.570
27.972	5.177
27.973	5.098
27.974	4.966
27.975	4.834
27.976	4.451
30.877	4.489
30.878	5.043
30.879	5.148
30.880	5.267
30.881	5.333
30.957	4.792
30.958	4.858
30.959	4.951
33.857	5.384
33.858	5.252
33.859	5.028
33.943	4.803
33.944	4.711
33.945	4.553
36.842	4.696
36.843	4.933
36.844	5.065
36.845	5.079
36.846	5.158
36.847	5.435
36.930	5.290
39.913	5.274
39.914	5.433
39.915	5.617
40.000	4.852
40.001	5.116];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'JinLin2011';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
%weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Body temperature is guessed';
D3 = 'scaled function response during lactation is assumed to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3M382'; % Cat of Life
metaData.links.id_ITIS = '631522'; % ITIS
metaData.links.id_EoL = '328262'; % Ency of Life
metaData.links.id_Wiki = 'Hipposideros_pomona'; % Wikipedia
metaData.links.id_ADW = 'Hipposideros_pomona'; % ADW
metaData.links.id_Taxo = '64248'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800819'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hipposideros_pomona}}';
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
bibkey = 'JinLin2011'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s13364-010-0011-z}, ' ...
'author = {Long-ru Jin and Ai-qing Lin and Ke-ping Sun and Ying Liu and Jiang Feng}, ' ... 
'year = {2011}, ' ...
'title = {Postnatal development of morphological features and vocalization in the pomona leaf-nosed bat \emph{Hipposideros pomona}}, ' ...
'journal = {Acta Theriol}, ' ...
'volume = {56}, ' ...
'pages = {13–22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Westralunio_carteri
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Hyriidae';
metaData.species    = 'Westralunio_carteri'; 
metaData.species_en = 'Carter''s freshwater mussel'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 13]; 

%% set data
% zero-variate data

data.tp = 2.5*365;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Wiki';   
  temp.tp = C2K(16.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 50*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Klun2012';   
  temp.am = C2K(16.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.75;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'Wiki','Klun2012'};
  comment.Lp = '2.5 till 3 cm ';
data.Li  = 10.1;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on 306 till 309 mum glochidium length, but rather flat: 0.5*4/3*pi*0.015^3';
data.Wwi = 22.4; units.Wwi = 'g';   label.Wwi = 'flesh wet weight at shell length 10 cm';   bibkey.Wwi = 'BascDuzg2009';
  comment.Wwi = 'Based on data for Anadonta cygnea';
  
data.Ri  = 1000; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.152	0.075
1.727	1.330
2.579	3.654
2.648	4.097
2.656	3.212
2.878	2.622
2.880	2.437
2.881	2.327
2.955	2.105
3.030	1.847
3.526	3.397
3.746	3.102
3.807	4.577
3.810	4.135
3.823	2.586
3.892	2.954
4.106	3.545
4.612	3.840
4.675	5.021
4.828	3.988
4.872	7.529
4.905	3.471
5.683	6.128
5.685	5.870
5.837	4.984
5.842	4.431
5.855	2.808
5.919	3.804
5.988	4.284
6.638	4.727
6.717	3.915
6.780	5.169
6.786	4.432
7.297	4.137
7.581	4.949
7.656	4.580
7.797	5.133
7.881	3.695
8.023	4.174
8.452	5.023
8.731	6.388
8.749	4.175
8.812	5.355
8.817	4.728
8.880	5.909
9.611	5.319
9.759	4.987
9.811	7.532
9.825	5.835
10.053	4.581
10.845	5.467
10.920	5.209
10.994	4.988
11.635	6.501
11.786	5.910
11.846	7.386
11.936	5.320
11.939	4.841
12.086	4.620
12.807	5.284
12.878	5.542
12.959	4.510
13.021	5.801
13.101	4.952
13.816	6.318
13.820	5.801
13.967	5.580
14.115	5.285
14.267	4.437
14.762	6.060
14.830	6.687
14.832	6.392
14.913	5.433
14.989	4.954
15.773	6.761
15.776	6.503
15.778	6.208
15.926	5.913
15.928	5.618
16.860	7.094
16.941	6.061
16.944	5.766
17.003	7.463
17.010	6.541
17.012	6.320
17.451	5.840
17.812	6.210
17.892	5.214
18.031	6.025
18.100	6.505
18.107	5.656
18.826	6.505
18.831	5.841
18.893	7.206
19.048	6.063
19.629	6.026
19.777	5.621
19.838	7.096
19.843	6.543
19.917	6.322
19.993	5.879
20.715	6.396
20.719	5.953
20.858	6.728
20.939	5.695
21.079	6.322
21.160	5.326
21.727	7.024
21.803	6.581
21.808	5.991
22.755	5.659
22.964	6.729
23.753	7.984
23.757	7.504
23.838	6.435
23.987	5.992
23.990	5.660
24.634	6.841
24.712	6.140
24.715	5.845
25.001	6.362
25.584	6.141
25.588	5.661
25.862	7.727
25.871	6.547
25.873	6.325
25.876	5.920
26.747	5.994
26.808	7.506
26.825	5.404
26.885	6.879
26.890	6.289
27.897	7.544
27.908	6.142
27.972	7.249
28.046	7.065
28.849	6.623
28.851	6.364
30.000	7.914
30.950	7.251
30.952	6.956
31.747	7.436
31.750	7.067
33.997	7.622
34.008	6.294
34.802	6.922
34.806	6.479
35.892	6.812
35.970	6.148
39.882	7.404
40.828	7.257
41.987	7.590
43.733	7.333
44.909	5.600
44.972	6.707
49.982	6.968];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(16.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Klun2012';
comment.tL = 'Data for Collie River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Glochidium is here not assumed to extract nutrients from the host fish';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Uses fish and amphibians to cling its glochidia larvae (glochidia) and to metamorphose; The host forms cysts around glochidia, where they stay for 21-28 days';
metaData.bibkey.F1 = {'Wiki'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5BXV7'; % Cat of Life
metaData.links.id_ITIS = '988783'; % ITIS
metaData.links.id_EoL = '7262151'; % Ency of Life
metaData.links.id_Wiki = 'Westralunio_carteri'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '975527'; % Taxonomicon
metaData.links.id_WoRMS = '1306782'; % WoRMS
metaData.links.id_molluscabase = '1306782'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Echyridella_menziesii}}';
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
bibkey = 'Jame1985'; type = 'Article'; bib = [ ... 
'author = {M. R. James}, ' ... 
'year = {1985}, ' ...
'title = {Distribution, biomass and production of the freshwater mussel, \emph{Hyridella menziesi} ({G}ray), in {L}ake {T}aupu, {N}ew {Z}ealand}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {15}, ' ...
'pages = {307--314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wldb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://wldb.ilec.or.jp/data/databook_html/oce/oce-01.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nzgeo'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nzgeo.com/stories/what-is-killing-the-kakahi/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Klun2012'; type = 'PhDthesis'; bib = [ ... 
'author = {M. W. Klunzinger}, ' ... 
'year = {2012}, ' ...
'title = {Ecology, life history and conservation status of \emph{Westralunio carteri} {I}redale 1934, an endemic freshwater mussel of {S}outh-{W}estern {A}ustralia}, ' ...
'school = {Murdoch University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BascDuzg2009'; type = 'Article'; bib = [ ... 
'author = {N. S. Ba\c{s}\c{c}nar and E. D\"{u}zg\"{u}ne\c{s} and D. S. M{\i}s{\i}r and H. Polat and B. Zengin}, ' ... 
'year = {2009}, ' ...
'title = {Growth and Flesh Yield of the Swan Mussel \emph{Anodonta cygnea} ({L}innaeus, 1758) ({B}ivalvia: {U}nionidae) in Lake \c{C}ildir ({K}ars, {T}urkey)}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {9}, ' ...
'pages = {127--132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


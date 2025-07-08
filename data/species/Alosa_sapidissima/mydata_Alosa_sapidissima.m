  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_sapidissima

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_sapidissima'; 
metaData.species_en = 'American shad'; 

metaData.ecoCode.climate = {'MB','MC','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'MAW','THn'};
metaData.ecoCode.habitat = {'piMpe', '0bFr', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah_T'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 06 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1     = [2016 04 07];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};        
metaData.date_mod_2     = [2016 10 30];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30]; 

%% set data
% zero-variate data
data.ah14 = 10;   units.ah14 = 'd';  label.ah14 = 'age at hatch at 14C';  bibkey.ah14 = 'SavoCrec2004'; 
  temp.ah14 = C2K(14);  units.temp.ah14 = 'K'; label.temp.ah14 = 'temperature';
data.ah17 = 7;    units.ah17 = 'd';  label.ah17 = 'age at hatch at 17C';  bibkey.ah17 = 'SavoCrec2004'; 
  temp.ah17 = C2K(17); units.temp.ah17 = 'K'; label.temp.ah17 = 'temperature';
data.ah24 = 3;    units.ah24 = 'd';  label.ah24 = 'age at hatch at 24C';  bibkey.ah24 = 'SavoCrec2004'; 
  temp.ah24 = C2K(24);  units.temp.ah24 = 'K'; label.temp.ah24 = 'temperature';
data.ab = data.ah17+3.5;      units.ab = 'd';  label.ab = 'age at birth'; bibkey.ab = 'SavoCrec2004'; 
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4*365;  units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'marinebio'; % 4-6 yr
  temp.ap = C2K(15);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.18;  units.L0 = 'cm';   label.L0 = 'egg diameter';           bibkey.L0 = 'SavoCrec2004';
data.Lh = 0.85;   units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'SavoCrec2004'; % 7-10 mm
data.Lb = 0.9;    units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'MaltDaig2010';
data.Lp = 43;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; % 38-48.5 cm
data.Li = 76;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwi = 3600;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri = 6e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = {'marinebio'};   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
3.819	1.034
6.030	0.938
5.930	1.130
6.031	1.227
6.834	1.227
7.839	1.145
8.844	1.200
8.945	1.434
9.849	1.613
10.653	1.572
11.055	1.614
10.754	1.710
10.755	1.338
11.759	1.449
12.764	1.518
11.960	1.889
12.965	1.958
13.980	1.793
15.879	1.725
16.985	1.904
16.181	2.083
15.678	2.276
14.774	2.028
14.775	2.179
13.970	2.027
13.868	2.096
13.869	2.330
14.975	2.482
16.783	2.331
16.784	2.414
16.785	2.496
17.789	2.538
18.593	2.538
18.695	2.634
18.795	2.744
17.990	2.331
17.387	2.235
17.186	2.138
17.889	2.138
18.692	2.097
20.001	1.919
20.804	2.056
20.202	2.180
19.799	2.139
19.397	2.235
18.694	2.262
19.296	2.400
18.794	2.373
19.398	2.483
20.000	2.607
20.200	2.387
20.201	2.304
20.803	2.291
21.708	2.249
22.915	2.305
23.819	2.415
22.914	2.498
22.513	2.429
21.809	2.415
21.307	2.483
20.802	2.525
21.910	2.580
21.707	2.676
21.709	2.841
20.905	2.772
18.693	3.392
21.911	3.365
22.812	3.516
22.814	3.351
24.020	3.269
23.618	3.214
22.813	3.145
23.718	3.048
24.824	3.186
25.930	3.118
26.935	3.132
27.738	3.104
28.844	3.077
26.834	2.980
25.628	2.953
24.623	2.925
23.719	2.966
23.820	2.732
24.021	2.622
24.822	2.760
26.030	2.691
24.925	2.581
24.823	2.470
27.839	2.650
27.840	2.829
29.146	2.802
27.739	3.366
28.744	3.559
32.060	3.422
31.859	3.174
33.869	3.147
35.879	3.437
35.779	3.933
37.990	3.974
30.854	3.821
30.452	4.000
29.950	4.110
29.648	3.862
28.842	3.931
27.838	3.807
27.837	4.068
28.843	4.454
29.849	4.454
30.955	4.661
29.848	5.432
28.643	6.409
32.964	4.510
34.070	4.524
35.074	4.373
33.065	4.262
31.960	4.124
32.061	3.987
38.090	4.663
38.693	4.883
40.905	4.719
42.815	5.173
48.744	5.657
50.151	5.740
47.739	5.987
47.740	6.290
51.859	7.034
47.035	7.198
45.930	6.950
46.030	6.744
43.920	6.936
42.916	6.867
42.915	6.757
41.809	6.963
41.005	7.197
35.980	6.714
35.775	6.507
35.776	6.108
34.975	5.956
33.768	5.901
33.667	5.488
32.764	5.157
32.965	4.937
33.668	4.965
33.769	5.116
33.568	4.813
34.673	4.827
35.276	4.910
35.075	5.048
36.784	4.897
37.980	4.993
35.777	5.186
36.785	5.241
36.080	5.323
34.875	5.447
34.874	5.295
36.181	5.461
35.778	5.530
35.780	5.626
36.985	5.916
37.887	5.819
39.698	5.847
38.893	6.012
39.798	6.081
39.780	6.274
38.894	6.219
40.804	6.206
42.010	6.316
43.819	6.179
42.814	6.123
45.025	6.041
41.810	5.820
39.799	5.668
41.106	5.462
39.697	5.407
37.888	5.310
37.889	5.365];
[t, i] = sort(data.tL(:,1),1); data.tL = data.tL(i,:);
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
  comment.tL = 'temperature: increases from 9.5C in May till 21.1C in July';
bibkey.tL = {'MaltDaig2010'};
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 50;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.f_tL = 1;  units.psd.f_tL = '-';  label.psd.f_tL = 'scaled functional response for tL data';
weights.psd.f_tL = weights.psd.kap * 10;
weights.psd.kap = weights.psd.kap * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                                 
%% Links
metaData.links.id_CoL = '65WJV'; % Cat of Life
metaData.links.id_ITIS = '161702'; % ITIS
metaData.links.id_EoL = '46562374'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_sapidissima'; % Wikipedia
metaData.links.id_ADW = 'Alosa_sapidissima'; % ADW
metaData.links.id_Taxo = '42629'; % Taxonomicon
metaData.links.id_WoRMS = '158670'; % WoRMS
metaData.links.id_fishbase = 'Alosa-sapidissima'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_sapidissima}}';  
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
bibkey = 'MaltDaig2010'; type = 'Article'; bib = [ ...  
'author = {Maltais, E. and Daigle, G. and Colbeck, G. and Dodson, J. J.}, ' ...
'year = {2010}, ' ...
'title = {Spawning dynamics of American shad (\emph{Alosa sapidissima}) in the {S}t. {L}awrence {R}iver, {C}anada-{U}{S}{A}.}, ' ... 
'journal = {Ecology of Freshwater Fish}, ' ...
'volume = 19, '...
'pages = {586-594}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SavoCrec2004'; type = 'Article'; bib = [ ...    
'author = {T. F. Savoy and V. A. Crecco}, ' ...
'year  = {2004}, ' ...
'title = {American Shad Early Life History and Recruitment in the {C}onnecticut {R}iver: {A} 40-Year Summary.}, ' ...  
'journal = {American Fisheries Society Monograph}, ' ...
'volume = {9}, ' ...
'pages = {407--417}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{www.fishbase.org/summary/1584}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marinebio'; type = 'Misc'; bib = ...
'howpublished = {\url{http://marinebio.org/species.asp?id=443}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
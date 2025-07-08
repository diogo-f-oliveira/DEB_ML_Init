function [data, auxData, metaData, txtData, weights] = mydata_Gerres_cinereus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Gerres_cinereus'; 
metaData.species_en = 'Yellow fin mojarra'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 26];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EspiGall2014';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 16.5;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'EspiGall2015'; 
  comment.Lp = 'based on SL 13.9 cm and F2';
data.Li  = 41;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.56e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'EspiGall2015';
  comment.Wwb = 'based guessed egg diameter of 0.31 mm of Gerres_oyena: pi/6*0.031^3'; 
data.Wwp = 66.2; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01318*Lp^3.04, see F1';
data.Wwi = 1054; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.04, see F1; max. published weight: 530 g, but EspiGall2014 gives 1230 g';

data.GSI = 0.08;   units.GSI = '-';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'EspiGall2015';
  temp.GSI = C2K(27.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length-weight
data.tLW = [  ... % time since birth (yr), total length (cm), weight (g)
    1 16.76     47
    2 22.67    155
    3 30.00    317
    4 35.33    515
    5 39.83    728
    6 43.25    940
    7 44.40   1141
    8 NaN     1324
    9 NaN     1487];
data.tLW(:,1) = 365 * (0.3 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(27.3);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'EspiGall2014'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [  ... % total length (cm), weight (g)
14.142	36.266
14.352	39.177
14.720	44.993
14.878	39.238
15.456	50.851
15.771	59.547
15.876	53.786
15.982	42.252
16.244	50.942
16.822	65.441
16.876	30.809
17.138	48.158
17.294	85.702
17.505	79.953
17.506	65.520
17.926	80.002
18.189	62.713
18.241	94.471
18.662	62.767
18.871	97.431
19.135	71.482
19.397	100.378
19.660	88.862
19.923	91.779
19.975	111.991
20.291	100.481
20.344	77.395
20.710	126.509
20.921	106.327
21.080	94.799
21.447	117.934
21.763	97.765
22.024	152.640
22.708	132.513
22.813	126.752
23.022	161.415
23.075	170.081
23.968	196.163
23.969	155.751
24.494	184.678
24.652	176.036
25.860	210.815
27.069	205.181
27.541	234.102
28.330	239.966
28.644	283.301
28.698	242.895
28.905	317.971
28.908	248.693
29.011	297.777
29.062	343.968
29.170	271.816
29.377	358.437
29.798	332.507
30.798	318.189
31.322	358.662
31.586	321.167
33.210	477.231
34.212	410.955
34.260	517.764
34.624	621.724
34.996	540.942
34.998	471.664
35.099	581.366
37.094	659.535
37.880	734.677
38.564	723.210
38.927	853.148
38.981	815.629
38.987	656.867
39.192	798.334
39.301	700.202
39.352	726.187
39.661	896.532
39.769	830.153
39.825	746.448
39.981	786.878
40.608	887.982
40.971	1015.034
41.030	844.732
41.976	859.274
43.072	1081.668
44.332	1130.886
44.388	1044.294
44.959	1237.762
45.068	1142.517];
units.LW = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'EspiGall2014'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01318*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FX2F'; % Cat of Life
metaData.links.id_ITIS = '169032'; % ITIS
metaData.links.id_EoL = '46580899'; % Ency of Life
metaData.links.id_Wiki = 'Gerres_cinereus'; % Wikipedia
metaData.links.id_ADW = 'Gerres_cinereus'; % ADW
metaData.links.id_Taxo = '45280'; % Taxonomicon
metaData.links.id_WoRMS = '276954'; % WoRMS
metaData.links.id_fishbase = 'Gerres-cinereus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerres_cinereus}}';
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
bibkey = 'EspiGall2014'; type = 'Article'; bib = [ ... 
'author = {E. Espino-Barr and M. Gallardo-Cabello and E. G. Cabral-Sol\''{i}s and M. Puente-G\''{o}mez and A. Garcia-Boa}, ' ... 
'year = {2014}, ' ...
'title = {Growth of the yellowfin \emph{Gerris cinereus} off the {P}acific coast of {M}exico}, ' ...
'journal = {Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {9(1)}, ' ...
'pages = {14-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EspiGall2015'; type = 'Article'; bib = [ ... 
'author = {Elaine Espino-Barr and Manuel Gallardo-Cabello and Esther G. Cabral-Sol\''{i}s and Marcos Puente-G\''{o}mez and A. Garcia-Boa}, ' ... 
'year = {2015}, ' ...
'title = {Reproduction of \emph{Gerres cinereus} ({P}ercoidei: {G}erreidae) off the {M}exican {P}acific coast}, ' ...
'journal = {Revista Ciencias Marinas y Costeras}, ' ...
'volume = {7}, ' ...
'pages = {83-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gerres-cinereus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


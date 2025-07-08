function [data, auxData, metaData, txtData, weights] = mydata_Seriola_dumeriliSeriola_quinqueradiata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Seriola_quinqueradiata'; 
metaData.species_en = 'Japanese  amberjack'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW','MPh'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 10];

%% set data
% zero-variate data

data.ab = 2.08;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'fishbase';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'guess';   
  temp.am = C2K(23.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 86;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Seriola dumerili: 109*150/190';
data.Li  = 150;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 40e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI  = 0.05;  units.GSI  = '-'; label.GSI  = 'gonado-somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(22); units.temp.GSI = 'K';    label.temp.GSI = 'temperature';
  comment.GSI = 'based on Seriola dumerili';
 
% uni-variate data
% time-length
data.tL =	[ ... % time since birth (yr), totla length (cm)
0.365	14.431
0.445	17.848
0.550	17.542
0.558	20.956
0.642	22.976
0.720	34.772
0.771	31.671
0.877	33.227
0.969	36.334
1.023	40.836
1.218	40.067
1.269	39.449
1.362	41.625
1.392	39.764
1.450	43.335
1.527	41.321
1.534	46.287
1.603	42.410
1.614	49.548
1.685	52.655
1.703	48.931
1.719	52.501
1.769	55.606
1.804	50.021
1.854	55.609
1.891	57.163
2.280	62.453
2.353	55.008
2.364	63.543
2.365	58.422
2.431	65.718
2.446	56.408
2.483	61.065
2.518	58.273
2.533	63.239
2.639	63.398
2.715	66.194
2.802	73.181
2.845	70.544
2.887	71.943
2.954	76.600
2.955	74.118
3.042	78.621
3.127	76.142
3.208	74.438
3.221	72.111
3.272	71.492
3.292	75.217
3.314	72.735
3.378	72.117
3.390	74.600
3.459	70.413
3.483	73.362
4.129	83.163];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hond1950';
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to not differ from females';
D2 = 'temperatures are guessed';
D3 = 'ab is ignorned; the value probably related to hatch, rather than birth';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6YJC3'; % Cat of Life
metaData.links.id_ITIS = '168689'; % ITIS
metaData.links.id_EoL = '46578022'; % Ency of Life
metaData.links.id_Wiki = 'Seriola_quinqueradiata'; % Wikipedia
metaData.links.id_ADW = 'Seriola_quinqueradiata'; % ADW
metaData.links.id_Taxo = '45249'; % Taxonomicon
metaData.links.id_WoRMS = '126816'; % WoRMS
metaData.links.id_fishbase = 'Seriola-quinqueradiata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Seriola_quinqueradiata}}';
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
bibkey = 'Hond1950'; type = 'Article'; bib = [ ... 
'author = {Honda, K.}, ' ... 
'year = {1950}, ' ...
'title = {On the scales of Amber-fishes, \emph{Seriola quinqueradiata} (T. \& S.)}, ' ...
'journal = {Bull. Jap, Soc. sci. Fish.}, ' ...
'volume = {15(2)}, ' ...
'pages = {97-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Seriola-quinqueradiata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

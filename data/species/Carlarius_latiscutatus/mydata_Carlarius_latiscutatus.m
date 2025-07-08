function [data, auxData, metaData, txtData, weights] = mydata_Carlarius_latiscutatus
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Carlarius_latiscutatus'; 
metaData.species_en = 'Rough-head sea catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 28];

%% set data
% zero-variate data;

data.am = 10*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';
  temp.am = C2K(23.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27.5;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 85;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 1.8e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp  = 206.3; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00813*Lp^3.06, see F1';
data.Wwi  = 6.5e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00813*Li^3.06, see F1';
 
data.Ri  = 3.3e4/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(9.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.078	13.505
1.547	15.789
1.566	18.474
1.727	16.550
1.728	17.445
1.736	15.399
1.738	19.619
1.782	18.466
1.801	19.489
1.808	15.396
1.809	17.570
2.026	20.248
2.035	19.608
2.044	18.585
2.063	21.269
2.297	22.156
2.298	23.690
2.379	23.304
2.415	24.837
2.657	21.375
2.657	22.271
2.803	24.823
2.812	25.462
2.900	21.494
3.227	28.644
3.308	26.595
3.309	30.687
3.570	28.759
3.724	32.718
3.794	27.344
3.795	29.646
3.803	26.449
4.048	30.532
4.058	34.624
4.068	36.541
4.318	31.545
4.481	33.585
4.563	36.395
4.654	38.438
4.661	32.428
4.672	36.647
4.797	35.492
4.807	37.537
5.059	37.272
5.482	36.490
5.493	39.558
6.475	40.673];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % conver yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length','females'};  
temp.tL    = C2K(23.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ConaCama1995';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'GQW7'; % Cat of Life
metaData.links.id_ITIS = '680694'; % ITIS
metaData.links.id_EoL = '66647746'; % Ency of Life
metaData.links.id_Wiki = 'Carlarius_latiscutatus'; % Wikipedia
metaData.links.id_ADW = 'Arius_latiscutatus'; % ADW
metaData.links.id_Taxo = '5888974'; % Taxonomicon
metaData.links.id_WoRMS = '1525989'; % WoRMS
metaData.links.id_fishbase = 'Carlarius-latiscutatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carlarius_latiscutatus}}';
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
bibkey = 'ConaCama1995'; type = 'Article'; bib = [ ... 
'author = {Francois Conand and Sekou Balta Camara and Francois Domain},'...
'title = {AGE AND GROWTH OF THREE SPECIES OF {A}RIIDAE ({S}ILURIFORMES) IN COASTAL WATERS OF {G}UINEA},'...
'journal = {BULLETIN OF MARINE SCIENCE. 56(1): 5M7, 1995 }, '...
'volume = {46}, '...
'year = {1995}, '...
'pages = {58-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Carlarius-latiscutatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_zenithicus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_zenithicus'; 
metaData.species_en = 'Shortjaw cisco'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFl'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 10]; 

%% set data
% zero-variate data
data.am = 22*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'MuirVecs2014';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'ADW'; 
  comment.Lp = 'based on tp 4-5 yr and tL data';
data.Li = 40;  units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'Computed from egg diameter of 2-3 mm of Coregonus kiyi: pi/6*0.225^3';
data.Wwp = 33;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00537*Lp^3.22, see F1';
data.Wwi = 774;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.22, see F1, ADW gives 1 kg';
    
data.Ri = 34891/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Coregonus_hoyi (which has the same size)';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1.900	23.860
1.900	12.586
1.900	11.827
1.950	10.960
2.000	10.635
2.100	13.562
2.950	11.723
3.050	11.181
3.050	13.024
3.900	11.943
4.050	14.979
4.900	11.405
4.950	12.055
4.950	17.150
5.000	18.559
5.000	19.318
5.050	15.416
5.050	16.066
5.200	14.441
5.900	14.769
5.950	17.804
6.000	12.167
6.100	18.780
6.950	23.878
7.050	18.892
7.050	17.374
7.050	17.158
7.050	16.290
7.050	14.881
7.150	19.868
7.950	18.570
8.000	23.882
9.000	18.574
9.050	26.596
9.050	25.620
9.050	20.959
9.050	19.875
9.900	17.818
9.900	18.794
9.900	19.553
9.900	23.889
9.900	27.791
9.900	28.550
9.950	22.588
10.000	26.382
10.100	25.515
11.000	27.795
11.000	26.711
11.000	24.326
11.000	23.567
11.100	20.858
11.950	13.164
11.950	18.042
12.000	20.753
12.000	21.620
12.000	22.812
12.000	26.173
12.050	24.113
13.000	20.756
13.900	24.012
13.900	24.770
13.950	23.361
14.000	26.614
14.900	18.378
16.000	22.718
17.000	29.443
18.000	26.520
22.050	20.897];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MuirVecs2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed not to differ from females due to lack of data';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: W in g = 0.00537*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'YDCF'; % Cat of Life
metaData.links.id_ITIS = '161948'; % ITIS
metaData.links.id_EoL = '994762'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_zenithicus'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_zenithicus'; % ADW
metaData.links.id_Taxo = '171743'; % Taxonomicon
metaData.links.id_WoRMS = '567528'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-zenithicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_zenithicus}}';  
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
bibkey = 'MuirVecs2014'; type = 'Article'; bib = [ ...  
'doi = {10.1111/eff.12098}, ' ...
'author = {Andrew M. Muir and Paul Vecsei and Michael Power and Charles C. Krueger and James D. Reist}, ' ...
'year = {2014}, ' ...
'title = {Morphology and life history of the {G}reat {S}lave {L}ake ciscoes ({S}almoniformes: {C}oregonidae}, ' ... 
'journal = {Ecology of Freshwater Fish}, ' ...
'pages = {453-469}, ' ...
'volume = {23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-zenithicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_zenithicus/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


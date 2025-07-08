function [data, auxData, metaData, txtData, weights] = mydata_Carlarius_heudelotii
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Carlarius_heudelotii'; 
metaData.species_en = 'Smoothmouth sea catfish'; 

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

data.Lp  = 41;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 83;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 1.8e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp  = 547; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00794*Lp^3.00, see F1';
data.Wwi  = 4.5e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00794*Li^3.00, see F1';
 
data.Ri  = 2.6e4/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(9.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.571	21.817
1.578	17.575
1.641	16.674
1.722	17.573
1.739	15.773
1.740	16.801
1.750	19.500
1.802	14.615
1.814	20.656
1.820	15.900
1.930	17.697
2.058	21.680
2.068	23.865
2.069	25.664
2.310	22.446
2.319	21.546
2.329	23.731
2.418	21.673
2.419	22.958
2.563	22.313
2.564	24.755
2.816	23.594
2.835	25.650
2.934	26.805
3.071	28.730
3.252	30.655
3.296	28.855
3.330	25.512
3.331	27.826
3.424	31.937
3.432	30.652
3.917	27.558
4.425	34.104
4.426	35.646
4.427	38.089
4.443	34.746
4.571	37.700
5.427	38.841];
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
F1 = 'length-weight: W in g = 0.00794*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '5XBZW'; % Cat of Life
metaData.links.id_ITIS = '680692'; % ITIS
metaData.links.id_EoL = '46582124'; % Ency of Life
metaData.links.id_Wiki = 'Carlarius_heudelotii'; % Wikipedia
metaData.links.id_ADW = 'Arius_heudelotii'; % ADW
metaData.links.id_Taxo = '1131022'; % Taxonomicon
metaData.links.id_WoRMS = '712438'; % WoRMS
metaData.links.id_fishbase = 'Carlarius-heudelotii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carlarius_heudelotii}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Carlarius-heudelotii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Carlarius_parkii
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Carlarius_parkii'; 
metaData.species_en = 'Guinean sea catfish'; 

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

data.Lp  = 32;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 75;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 1.8e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp  = 328; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00813*Lp^3.06, see F1';
data.Wwi  = 4.4e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00813*Li^3.06, see F1';
 
data.Ri  = 2.6e4/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(9.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.314	15.473
1.315	17.391
1.414	16.113
1.423	17.647
1.657	15.601
1.748	16.624
1.749	19.821
1.749	20.460
1.801	15.729
1.819	14.706
1.820	16.752
1.820	17.775
1.839	18.798
2.055	18.926
2.065	21.867
2.246	23.657
2.255	22.890
2.300	22.506
2.301	25.703
2.319	24.808
2.398	20.077
2.408	21.355
2.408	22.762
2.409	25.703
2.554	26.598
2.653	24.680
2.805	21.739
2.825	27.749
3.250	30.563
3.302	23.913
3.303	28.005
3.403	28.772
3.908	30.563
3.917	29.540
3.918	31.969
4.072	33.504
4.073	35.806
4.216	32.609
4.252	33.504
4.424	32.992
4.425	37.084
4.478	34.910
4.578	34.910
5.246	37.980
5.327	37.852
6.429	41.816
6.492	40.921];
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
metaData.links.id_CoL = '5XBYZ'; % Cat of Life
metaData.links.id_ITIS = '680703'; % ITIS
metaData.links.id_EoL = '211650'; % Ency of Life
metaData.links.id_Wiki = 'Carlarius_parkii'; % Wikipedia
metaData.links.id_ADW = 'Arius_parkii'; % ADW
metaData.links.id_Taxo = '5300601'; % Taxonomicon
metaData.links.id_WoRMS = '1020768'; % WoRMS
metaData.links.id_fishbase = 'Carlarius-parkii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carlarius_parkii}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Carlarius-parkii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


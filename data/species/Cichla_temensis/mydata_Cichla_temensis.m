  function [data, auxData, metaData, txtData, weights] = mydata_Cichla_temensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Cichla_temensis'; 
metaData.species_en = 'Speckled pavon'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 29];

%% set data
% zero-variate data
data.ab = 2.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 33.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'fishbase';
data.Li = 99;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'actually 80 cm, but the is inconsistent with Wwi combined with F1';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 564.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01175*Lp^3.07, see F1';
data.Wwi = 15.7e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published 12.2 kg, but based on 0.01175*Li^3.07, see F1';

data.Ri = 5e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.008	27.256
0.009	28.971
0.011	21.135
0.012	25.053
0.013	26.278
0.014	15.994
0.984	30.747
0.998	36.625
1.012	34.912
1.027	42.505
1.028	59.402
1.968	31.052
1.996	42.319
1.997	33.013
2.011	50.646
2.038	38.158
2.039	59.709
2.053	41.098
2.952	42.133
2.995	43.605
3.009	45.565
3.023	40.178
3.052	52.914
3.066	47.527
3.067	50.956
3.936	61.785
3.950	54.928
3.963	59.093
3.964	42.439
3.978	63.991
3.979	56.155
3.993	35.094
4.007	51.258
4.021	66.443
4.036	46.852
4.991	66.747
5.004	51.564
5.005	62.585
5.006	65.279
5.048	54.506
5.062	59.160
5.975	56.032
6.004	54.319
8.029	74.770];
data.tL(:,1) = (data.tL(:,1) + 0.9) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JepsWine1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
%weights.Wwp = weights.Wwp * 0;
%weights.Wwi = weights.Wwi * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

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
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'V7R3'; % Cat of Life
metaData.links.id_ITIS = '169858'; % ITIS
metaData.links.id_EoL = '212574'; % Ency of Life
metaData.links.id_Wiki = 'Cichla_temensis'; % Wikipedia
metaData.links.id_ADW = 'Cichla_temensis'; % ADW
metaData.links.id_Taxo = '171191'; % Taxonomicon
metaData.links.id_WoRMS = '1015785'; % WoRMS
metaData.links.id_fishbase = 'Cichla-temensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cichla_temensis}}';  
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
bibkey = 'PereEdwa2015'; type = 'Article'; bib = [ ...
'author = {Caroline Pereira Campos and Carlos Edwar de Carvalho Freitas and Sidineia Amadio}, ' ...
'year = {2015}, ' ...
'title = {Growth of the \emph{Cichla temensis} {H}umboldt, 1821 ({P}erciformes: {C}ichlidae) from the middle rio {N}egro, {A}mazonas, {B}razil}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {13(2)}, '...
'pages = {413-420}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JepsWine1999'; type = 'Article'; bib = [ ...
'author = {D. B. Jepsen and K. O. Winemiller and D. C. Taphorn and D. Rodriguez Olarte}, ' ...
'year = {1999}, ' ...
'title = {Age structure and growth of peacock cichlids from rivers and reservoirs of {V}enezuela}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {55}, '...
'pages = {433±-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cichla-temensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


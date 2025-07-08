function [data, auxData, metaData, txtData, weights] = mydata_Electrona_carlsbergi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Electrona_carlsbergi'; 
metaData.species_en = 'Electron subantarctic'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.7); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 01];

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'GreeGart1999';  
  temp.am = C2K(0.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.3;   units.Lp = 'cm';   label.Lp = 'standard length fat puberty';    bibkey.Lp = 'fishbase';
data.Li = 11.2;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3; Wiki gives this in the article on Electrona';
data.Wwp = 5.2; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';  
  comment.Wwi = 'based on 0.00692*Lp^3.13, see F1';
data.Wwi = 13.3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00692*Li^3.13, see F1';

data.Ri = 3.5e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(0.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr),standard length
0.975	6.700
1.980	7.407
1.985	6.905
1.986	6.973
1.987	7.128
2.002	7.165
2.973	6.533
2.975	7.388
2.977	7.903
2.981	7.004
2.982	7.103
2.983	7.202
2.984	7.494
2.985	7.599
3.005	7.295
3.981	8.200
3.986	7.605
3.987	7.723
3.993	7.283
3.994	7.512
4.000	6.800
4.001	6.924
4.002	7.010
4.008	7.196
4.016	7.128
4.017	7.401
4.018	7.928
4.978	8.795
4.982	7.798
4.983	7.921
4.984	8.207
4.992	8.405
4.997	7.283
5.012	7.599
5.013	7.692
5.970	7.605
5.978	7.494
5.993	7.717
6.003	8.318];
data.tL(:,1) = (data.tL(:,1) + 0.9)* 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(0.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZijuLian2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'Length-Weight relationship: W in g = 0.00692*(SL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6F39W'; % Cat of Life
metaData.links.id_ITIS = '623810'; % ITIS
metaData.links.id_EoL = '46564136'; % Ency of Life
metaData.links.id_Wiki = 'Electrona_carlsbergi'; % Wikipedia
metaData.links.id_ADW = 'Electrona_carlsbergi'; % ADW
metaData.links.id_Taxo = '173595'; % Taxonomicon
metaData.links.id_WoRMS = '234638'; % WoRMS
metaData.links.id_fishbase = 'Electrona-carlsbergi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Electrona_carlsbergi}}';
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
bibkey = 'ZijuLian2017'; type = 'article'; bib = [ ...
'doi = {10.13679/j.jdyj.2017.4.477}, ' ...
'author = {Liu Zijun and Wei Lian and Zhu Guoping and Zhang Haiting}, ' ... 
'year   = {2017}, ' ...
'title  = {Validation of ageing \emph{Electrona carlsbergi} in the {S}outh {S}hetland {I}slands}, ' ...
'journal = {Chinese Journal of Polar Research}, ' ...
'page = {477-485}, ' ...
'volume = {29(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Electrona-carlsbergi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


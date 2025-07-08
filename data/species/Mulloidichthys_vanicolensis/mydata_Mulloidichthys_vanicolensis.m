function [data, auxData, metaData, txtData, weights] = mydata_Mulloidichthys_flavolineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Mulloidichthys_vanicolensis'; 
metaData.species_en = 'Yellowfin goatfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 22];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39.8;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.1e-4; units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.99 mm: pi/6*0.099^3';
data.Wwp = 188;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.09, see F1';
data.Wwi = 898;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.09, see F1; max published weight 1.1 kg';
 
data.Ri = 2e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Mulloidichthys flavolineatus';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.971	18.967
0.972	16.772
0.977	18.485
0.978	17.307
0.978	16.344
0.990	15.273
0.994	17.949
1.006	17.093
1.007	15.915
1.938	23.920
1.952	19.530
1.956	23.170
1.961	24.508
1.967	24.133
1.968	22.474
1.968	21.189
1.969	19.797
1.969	18.726
1.972	24.936
1.974	21.831
1.979	22.206
1.980	20.439
1.984	23.597
1.990	22.741
1.998	19.154
2.002	21.134
2.003	20.117
2.952	26.516
2.959	25.391
2.965	24.802
2.969	27.104
2.976	26.033
2.976	25.659
2.987	26.729
2.999	24.855
3.949	29.219
3.950	28.363
3.950	27.988
3.967	27.238
3.978	29.593
3.978	28.790
4.976	30.155
4.981	29.781
4.987	31.065
4.987	29.459];
data.tL(:,1) = 365*(0.8+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MehaOsma2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44K3K'; % Cat of Life
metaData.links.id_ITIS = '169411'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Mulloidichthys_vanicolensis'; % Wikipedia
metaData.links.id_ADW = 'Mulloidichthys_vanicolensis'; % ADW
metaData.links.id_Taxo = '180474'; % Taxonomicon
metaData.links.id_WoRMS = '218648'; % WoRMS
metaData.links.id_fishbase = 'Mulloidichthys-vanicolensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mulloidichthys_vanicolensis}}';
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
bibkey = 'MehaOsma2018'; type = 'article'; bib = [ ... 
'doi = {10.1111/jai.13590}, ' ...
'author = {S. F. Mehanna1 and A. G. M. Osman and M. M. S. Farrag and Y. A. A. Osman}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of three common species of goatfish exploited by artisanal fishery in {H}urghada fishing area, {E}gypt}, ' ...
'journal = { J Appl Ichthyol.}, ' ...
'volume = {34)}, ' ...
'pages = {917–921}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mulloidichthys-vanicolensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

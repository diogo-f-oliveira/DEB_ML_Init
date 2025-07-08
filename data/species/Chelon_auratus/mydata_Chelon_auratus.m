function [data, auxData, metaData, txtData, weights] = mydata_Chelon_auratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Chelon_auratus'; 
metaData.species_en = 'Golden gray mullet'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 25];

%% set data
% zero-variate data

data.am = 10*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'KesiYemi2020';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'KesiYemi2020'; 
data.Li  = 40;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm for Mugil cephalus: pi/6*0.09^3';
data.Wwp = 101.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lp^3.047, see F1';
data.Wwi = 479.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.04, see F1; max reproted weight: 680 g';
  
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'KesiYemi2020';
  temp.GSI = C2K(24); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
1	18.068
1	13.279
1	16.170
1	17.164
2	17.334
2	25.015
2	19.141
2	18.418
2	22.123
2	21.129
2	19.954
2	24.021
2	23.026
3	23.648
3	20.937
3	20.305
3	29.160
3	25.907
3	24.732
3	27.624
3	27.262
3	21.660
3	23.015
3	30.244
4	26.619
4	26.167
4	28.065
4	27.161
4	32.944
4	30.775
4	29.149
4	24.992
4	24.088
4	23.094
5	29.228
5	27.150
5	29.951
5	28.143
5	31.848
6	33.825
6	30.933
6	33.102
6	31.927
6	36.264
7	37.880
8	38.863
8	38.049
10	47.153];
data.tL(:,1) = (data.tL(:,1) + 1) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-6;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  bibkey.tL = 'KesiYemi2020';
temp.tL   = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

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
% set1 = {''}; subtitle1 = {'\'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85 * TL'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TVBL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46571486'; % Ency of Life
metaData.links.id_Wiki = 'Chelon_auratus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5310852'; % Taxonomicon
metaData.links.id_WoRMS = '1044127'; % WoRMS
metaData.links.id_fishbase = 'Chelon-auratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelon_auratus}}';
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
bibkey = 'KesiYemi2020'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315420000764}, ' ...
'author = {Kesikta\c{s}, Mert and Yemi\c{s}ken, Emre and Yildiz, Taner and Eryilmaz, L\"{u}tfiye}, ' ... 
'year = {2020}, ' ...
'title = {Age, growth and reproduction of the golden grey mullet, \emph{Chelon auratus} ({R}isso, 1810) in the Golden Horn Estuary, Istanbul}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chelon-auratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

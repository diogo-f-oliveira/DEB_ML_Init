function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_symmetricus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_symmetricus'; 
metaData.species_en = 'Pacific jack mackerel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data

data.ab = 1.4;        units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';   
  temp.ab = C2K(24);units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30 * 365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase'; 
  temp.am = C2K(9.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 31;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wiki'; 
  comment.Lp = 'for females';
data.Li  = 81;        units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.78e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.81 mm of Trachurus_mediterraneus: pi/6*0.081^3';
data.Wwp = 253.7;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00977*Lp^2.96, see F1';
data.Wwi = 4.355e3;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^2.96, see F1';

data.Ri  = 53000/ 365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(9.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [  % time since birth (yr), otolith weight (mg)
    2.19 15.88
    3.19 23.10
    4.19 30.30
    5.19 37.48
    6.19 44.64
    7.19 51.78
    8.19 58.90
    9.19 66.01
   10.19 73.09
   11.19 80.16 ];
data.tL(:,1) = (data.tL(:,1) + 0) * 365; % convert yr class to time since birth (d)
data.tL(:,2) = 1.075*((data.tL(:,2)-7.508)/0.003).^(1/2.53); % otolith weight to total length unsing F2
units.tL   = {'d', 'g'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(9.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArayCubi2001';
comment.tL = 'converted from otolith weight, via fork length, to total length';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: wet weight (g) = 0.00977*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
F2 = 'from photo: TL = 1.075 * FL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '57PL4'; % Cat of Life
metaData.links.id_ITIS = '168586'; % ITIS
metaData.links.id_EoL = '46578066'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_symmetricus'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_symmetricus'; % ADW
metaData.links.id_Taxo = '45254'; % Taxonomicon
metaData.links.id_WoRMS = '273305'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-symmetricus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_symmetricus}}';
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
bibkey = 'ArayCubi2001'; type = 'Article'; bib = [ ... 
'doi = {10.1016/s0165-7836(00)00233-2}, ' ...
'author = {Miguel Araya and Luis A Cubillos and Margarita Guzm\''{a}n and Jessica Peñailillo and Aquiles Sep\''{u}lveda}, ' ... 
'year = {2001}, ' ...
'title = {Evidence of a relationship between age and otolith weight in the {C}hilean jack mackerel, \emph{Trachurus symmetricus murphyi} ({N}ichols)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {51(1)}, ' ...
'pages = {17-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Trachurus-symmetricus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


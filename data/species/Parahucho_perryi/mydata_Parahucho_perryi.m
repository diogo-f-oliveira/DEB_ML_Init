  function [data, auxData, metaData, txtData, weights] = mydata_Parahucho_perryi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Parahucho_perryi'; 
metaData.species_en = 'Japanese huchen'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', '0iFe', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 19];

%% set data
% zero-variate data
data.am = 20*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'EdoaKawa2005';   
  temp.am = C2K(6.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 100;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
  comment.Lp = '28 to 34 cm';
data.Li = 200;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm of Stenodus leucichthys: pi/6*0.25^3';
data.Wwp = 6.5e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00741*Lp^2.97, see F1';
data.Wwi = 50.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00741*Li^2.97, see F1; max. published weight: 24.0 kg';
    
data.Ri = 1e4/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(6.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (yy), fork length (cm)
 0	2.483
 1	7.448
 2	14.069
 3	23.586
 4	35.862
 5	43.724
 6	51.448
 7	55.448
 8	59.310
 9	62.621
10	65.103
11	69.103
12	72.966
13	74.897];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(6.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EdoaKawa2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M =  5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Temperature is guessed at the preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00741*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.93 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '75PXN'; % Cat of Life
metaData.links.id_ITIS = '623487'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Parahucho_perryi'; % Wikipedia
metaData.links.id_ADW = 'Parahucho_perryi'; % ADW
metaData.links.id_Taxo = '508591'; % Taxonomicon
metaData.links.id_WoRMS = '320038'; % WoRMS
metaData.links.id_fishbase = 'Parahucho-perryi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Parahucho_perryi}}';  
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
bibkey = 'EdoaKawa2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-004-6115-z}, ' ...
'author = {Kaneaki Edoa and Youichi Kawaguchi and Masanori Nunokawa and Hiloshi Kawamula and Seigo Higashia}, ' ...
'year = {2005}, ' ...
'title = {Morphology, stomach contents and growth of the endangered salmonid, {S}akhalin taimen \emph{Hucho perryi}, captured in the Sea of Okhotsk, northern {J}apan: evidence of an anadromous form}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'pages = {1–7}, ' ...
'volume = {74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Parahucho-perryi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


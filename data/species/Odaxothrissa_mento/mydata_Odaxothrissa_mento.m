  function [data, auxData, metaData, txtData, weights] = mydata_Odaxothrissa_mento
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Odaxothrissa_mento'; 
metaData.species_en = 'Nigerian fangtooth pellonuline';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 09];

%% set data
% zero-variate data
data.am = 9.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'QuarAlhs2024';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 6.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 14;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Kimu1995';

data.Wwb = 6.5e-5; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Pete1999';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Pete1999'};
  comment.Wwi = 'based on 0.00851*Lp^2.91';
data.Wwi = 18.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','Kimu1995'};
  comment.Wwi = 'based on 0.00851*Li^2.91, see F1]; max published weight 41 g';
  
data.Ri = 2.4e4/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
  
% uni-variate data

% time-length
data.tL = [ ... % year class (yr), standard length (cm)
105.485	4.666
167.535	4.183
365+45.625	6.719
365+74.460	6.748
365+106.215	6.778
365+136.145	6.753
365+167.900	6.782
365+227.030	7.166
365+258.055	7.601
730+13.505	8.694
730+45.260	8.723
730+105.120	8.700
730+136.510	8.730
730+167.535	8.813
730+198.925	8.734
730+226.300	9.143
730+257.325	9.226
730+289.445	9.310
730+319.740	9.772
1095+75.555	9.700
1095+167.535 10.194];
data.tL(:,1) = data.tL(:,1) + 200; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'QuarAlhs2024';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48MXZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '223657'; % Ency of Life
metaData.links.id_Wiki = 'Odaxothrissa'; % Wikipedia
metaData.links.id_ADW = 'Odaxothrissa_mento'; % ADW
metaData.links.id_Taxo = '490936'; % Taxonomicon
metaData.links.id_WoRMS = '1017109'; % WoRMS
metaData.links.id_fishbase = 'Odaxothrissa-mento'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Stolothrissa_tanganicae}}';  
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
bibkey = 'QuarAlhs2024'; type = 'article'; bib = [ ... 
'doi = {10.1111/lre.12457}, ' ...
'author = {Evelyn Nhyiraba Quarshie and Elliot Haruna Alhassan and Seth Mensah Abobi}, ' ... 
'year = {2024}, ' ...
'title = {Growth and population structure of \emph{Odaxothrissa mento} and \emph{Brycinus leuciscus} from the lower reaches of the {W}hite {V}olta in {G}hana}, ' ...
'journal = {Lakes & Reservoirs: Science, Policy and Management for Sustainable Use}, ' ...
'volume = {29}, ' ...
'pages = {1-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Odaxothrissa-mento.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

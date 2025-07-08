  function [data, auxData, metaData, txtData, weights] = mydata_Cnidoglanis_macrocephalus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Plotosidae';
metaData.species    = 'Cnidoglanis_macrocephalus'; 
metaData.species_en = 'Estuary cobbler'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIE';'MPSW'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 29];

%% set data
% zero-variate data
data.ab = 44.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(18.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 41;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 91;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.18;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Davi1977a';
  comment.Wwb = 'based on egg diameter of 7 mm: pi/6*0.7^3';
data.Wwp = 408.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Davi1977a';
  comment.Wwp = 'based on 0.00457*Lp^3.07, see F1';  
data.Wwi = 4.72e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*Li^3.07, see F1';
  
data.Ri  = 7483/365; units.Ri  = '#/d';label.Ri  = 'reprod rate at Lw = 200 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 18.11
    2 31.45
    3 41.81
    4 51.75
    5 58.06];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NelPott1985';
comment.tL = '';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwb * 3;
weights.ab = weights.ab * 0;
%weights.Wwi = weights.Wwi * 3;
%weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 1;

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
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WJFT'; % Cat of Life
metaData.links.id_ITIS = '640213'; % ITIS
metaData.links.id_EoL = '46581867'; % Ency of Life
metaData.links.id_Wiki = 'Cnidoglanis_macrocephalus'; % Wikipedia
metaData.links.id_ADW = 'Cnidoglanis_macrocephalus'; % ADW
metaData.links.id_Taxo = '171492'; % Taxonomicon
metaData.links.id_WoRMS = '280227'; % WoRMS
metaData.links.id_fishbase = 'Cnidoglanis-macrocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cnidoglanis_macrocephalus}}';  
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
bibkey = 'NelPott1985'; type = 'Article'; bib = [ ...
'doi = {10.1016/0272-7714(85)90081-2}, ' ...
'author = {Nel, S. A. and Potter, I. C. and Loneragan, N. R.}, ' ...
'year = {1985}, ' ...
'title = {The biology of the catfish \emph{Cnidoglanis macrocephalus} ({P}lotosidae) in an {A}ustralian estuary}, ' ... 
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {21(6)}, '...
'pages = {895–909}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cnidoglanis_macrocephalus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


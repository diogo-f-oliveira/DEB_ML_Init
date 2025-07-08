function [data, auxData, metaData, txtData, weights] = mydata_Paralichthys_lethostigma

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Paralichthys_lethostigma'; 
metaData.species_en = 'Southern flounder'; 

metaData.ecoCode.climate = {'MB','Cfa'};
metaData.ecoCode.ecozone = {'MAW','MAg','THn'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd','0iFe','0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 21]; 

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishesoftexas';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'fishesoftexas'; 
data.Li  = 91.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishesoftexas';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on egg diameter of 0.7 to 0.8 mm of Paralichthys_californicus: 4/3*pi*0.0375^3';
data.Wwp = 307;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwp = 'based on 0.00617*Li^3.18, see F1';
data.Wwi = 10.7e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00617*Li^3.18, see F1';

data.Ri  = 4e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data females
data.tL = [... % time since birth (yr), std length (cm)
 1  6.3
 2 10.2
 3 14.5
 4 19.1
 5 23.1
 6 27.2
 7 32.0
 8 35.1
 9 38.2]; 
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL = C2K(19); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length - weight: Ww in g = 0.00617*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length - length from photo: SL = 0.85 * TL)';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4CYVM'; % Cat of Life
metaData.links.id_ITIS = '172738'; % ITIS
metaData.links.id_EoL = '46570502'; % Ency of Life
metaData.links.id_Wiki = 'Paralichthys_lethostigma'; % Wikipedia
metaData.links.id_ADW = 'Paralichthys_lethostigma'; % ADW
metaData.links.id_Taxo = '182812'; % Taxonomicon
metaData.links.id_WoRMS = '158829'; % WoRMS
metaData.links.id_fishbase = 'Paralichthys-lethostigma'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralichthys_lethostigma}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Paralichthys-lethostigma.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/paralichthys lethostigma.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Paralichthys_californicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



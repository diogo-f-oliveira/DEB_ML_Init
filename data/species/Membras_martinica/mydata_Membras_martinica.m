function [data, auxData, metaData, txtData, weights] = mydata_Membras_martinica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Membras_martinica'; 
metaData.species_en = 'Rough silverside'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAg'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab';'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'dLj'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 16]; 

%% set data
% zero-variate data

data.ab = 6.5;   units.ab = 'd';    label.ab = 'age at birht';                 bibkey.ab = 'MartDrew1978';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 2*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'MartDrew1978';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 2;    units.Lj  = 'cm';  label.Lj  = 'total length at metam';      bibkey.Lj  = 'MartDrew1978'; 
data.Lp  = 4.9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'MartDrew1978'; 
data.Li  = 13.78;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'MartDrew1978';
  comment.Li = 'based on SL 11.3 cm and F2';
 
data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MartDrew1978';
  comment.Wwb = 'based of egg diameter of 1 mm: pi/6*0.14^3';
data.Wwp = 0.724; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00525*Lp^3.10, see F1';
data.Wwi = 17.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.10, see F1';
  
data.Ri = 5e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Menidia_beryllina'; 

data.dLj = 0.9/30.5; units.dLj  = 'cm/d'; label.dLj  = 'growth rate a metam';  bibkey.dLj  = 'MartDrew1978';   
  temp.dLj = C2K(20); units.temp.dLj = 'K'; label.temp.dLj = 'temperature';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% facts
F1 = 'length-weight: WW in g = 0.00525 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.82 * TL';
metaData.bibkey.F2 = 'fishesoftexas';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3ZNLV'; % Cat of Life
metaData.links.id_ITIS = '165989'; % ITIS
metaData.links.id_EoL = '46566694'; % Ency of Life
metaData.links.id_Wiki = 'Membras_martinica'; % Wikipedia
metaData.links.id_ADW = 'Membras_martinica'; % ADW
metaData.links.id_Taxo = '179838'; % Taxonomicon
metaData.links.id_WoRMS = '159220'; % WoRMS
metaData.links.id_fishbase = 'Membras-martinica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Membras_martinica}}'];
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
bibkey = 'MartDrew1978'; type = 'Book'; bib = [ ... 
'author = {F. Douglas Martin and George E. Drewry}, ' ... 
'year = {1978}, ' ...
'title = {Development of Fishes of the Mid-Atlantic Bight; an atlas of egg, larval and juvenile stages}, ' ...
'publisher = {Fish and Wildlife Service: U.S. Department of the Interior}, ' ...
'volume = {6: Stromateidae through Ogcocephalidae}, ' ...
'pages = {92-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Membras_martinica.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = [...
'howpublished = {\url{http://txstate.fishesoftexas.org/membras martinica.htm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


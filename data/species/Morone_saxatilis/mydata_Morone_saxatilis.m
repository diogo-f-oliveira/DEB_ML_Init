function [data, auxData, metaData, txtData, weights] = mydata_Morone_saxatilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Moroniformes'; 
metaData.family     = 'Moronidae';
metaData.species    = 'Morone_saxatilis'; 
metaData.species_en = 'Striped bass'; 

metaData.ecoCode.climate = {'MB','MC','Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'MAE','MAg','THn'};
metaData.ecoCode.habitat = {'0jFl','0jFr','jiMd'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011


metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2020 08 08];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2020 08 08]; 

%% set data
% zero-variate data

data.ab = 2.5;  units.ab = 'd';      label.ab = 'age at birth';                 bibkey.ab = 'ADW';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 30 * 365;  units.am = 'd';      label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 43.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishesoftexas';
data.Li  = 200;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwi = 80.4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.04, see F1; AWD gives 3.2 kg';

data.Ri = 16e4*80.4/365;   units.Ri = 'g';  label.Ri = 'Reprod rate max rate';      bibkey.Ri = 'fishesoftexas';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 8e4 per 0.5 kg';
  
% uni-variate data
data.tL = [ ... % time since birth (yr), total length (cm)
    1 16.8
    2 33.0
    3 47.3
    4 59.8
    5 70.0
    6 77.4
    7 84.2
    8 89.5
    9 93.3
   10 97.0
   11 101.9
   12 105.5];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'fishesoftexas';
comment.tL = 'Data from Apa;achicola River, florida';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 3 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean teperature is guessed';    
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6S3CN'; % Cat of Life
metaData.links.id_ITIS = '167680'; % ITIS
metaData.links.id_EoL = '46578728'; % Ency of Life
metaData.links.id_Wiki = 'Morone_saxatilis'; % Wikipedia
metaData.links.id_ADW = 'Morone_saxatilis'; % ADW
metaData.links.id_Taxo = '180401'; % Taxonomicon
metaData.links.id_WoRMS = '151179'; % WoRMS
metaData.links.id_fishbase = 'Morone-saxatilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Morone_saxatilis}}';
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
'howpublished = {\url{https://www.fishbase.in/summary/Morone-chrysops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Morone_saxatilis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/morone saxatilis.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


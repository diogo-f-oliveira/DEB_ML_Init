function [data, auxData, metaData, txtData, weights] = mydata_Noturus_gyrinus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_gyrinus'; 
metaData.species_en = 'Tadpole madtom'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 08 13]; 

%% set data
% zero-variate data;

data.am = 4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishesoftexas';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5/0.79;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishesoftexas';
  comment.Lp = 'Based on SL 5 cm (not clear if SL or TL), see F2';
data.Li  = 13;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishesoftexas';
  
data.Wwb = 1.36e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishesoftexas'; 
  comment.Wwb = 'based on egg diameter of 2.96 mm: pi/6*0.296^3';
data.Wwp = 2.79; units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwp = 'based on 0.00933*Lp^3.09, see F1';
data.Wwi = 25.4; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00933*Li^3.09, see F1';
  
data.Ri  = 61/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishesoftexas';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % year class (yr), standard length (cm)
    1 4.6
    2 5.6
    3 6.2
    4 6.7];
data.tL(:,1) = (1 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.79; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.79*TL';
metaData.bibkey.F2 = 'fishesoftexas'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6SCTV'; % Cat of Life
metaData.links.id_ITIS = '164003'; % ITIS
metaData.links.id_EoL = '204305'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_gyrinus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_gyrinus'; % ADW
metaData.links.id_Taxo = '181572'; % Taxonomicon
metaData.links.id_WoRMS = '1022873'; % WoRMS
metaData.links.id_fishbase = 'Noturus-gyrinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_gyrinus}}';
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
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/noturus gyrinus.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-gyrinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


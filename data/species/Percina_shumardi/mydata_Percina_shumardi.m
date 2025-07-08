  function [data, auxData, metaData, txtData, weights] = mydata_Percina_shumardi
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Percina_shumardi'; 
metaData.species_en = 'River darter'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 18]; 

%% set data
% zero-variate data
data.am = 3.5*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishesoftexas';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.8;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishesoftexas'; 
  comment.Lp = 'based on ap 1 yr and tL data';
data.Li = 10;    units.Li = 'cm'; label.Li = 'ultimate total length';    bibkey.Li = 'fishesoftexas';
  comment.Li = 'based on SL 8.8 cm and F2';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 0.7; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','fishesoftexas'};
   comment.Wwp = 'based on 0.00513*Lp^3.14 (see F1)';
data.Wwi = 7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','fishesoftexas'};
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';

data.Ri = 2.4e3;units.Ri = '#/d'; label.Ri = 'reprod rate at SL 8.3 cm, TL 9.4 cm';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'beased on same realtive fecundity, compared to P.sciera: 2000*(10/9.4)^3';
 
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1  4.2
    2  5.6];
data.tL(:,1) = 365 * (0 + data.tL(:,1));  % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.88; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;

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
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.88 * TL';
metaData.bibkey.F2 = 'fishesoftexas'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7744P'; % Cat of Life
metaData.links.id_ITIS = '168497'; % ITIS
metaData.links.id_EoL = '212341'; % Ency of Life
metaData.links.id_Wiki = 'Percina_shumardi'; % Wikipedia
metaData.links.id_ADW = 'Percina_shumardi'; % ADW
metaData.links.id_Taxo = '183493'; % Taxonomicon
metaData.links.id_WoRMS = '593220'; % WoRMS
metaData.links.id_fishbase = 'Percina-shumardi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Percina_shumardi}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Percina-shumardi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/percina shumardi.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


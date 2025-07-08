function [data, auxData, metaData, txtData, weights] = mydata_Notemigonus_crysoleucas

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notemigonus_crysoleucas'; 
metaData.species_en = 'Golden shiner'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 18]; 

%% set data
% zero-variate data

data.tp = 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'JohaMcQu1989';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 6.4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 32;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 2.61;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01202*Lp^3.04, see F1';
data.Wwi = 360;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.04, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
1	5.715
2	8.019
3	10.370
4	12.485];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JohaMcQu1989'; 

% length - fecundity
data.LN = [ ... % total length (cm), fecundity
11.75 1763
10.08  588
11.80 1558
10.32 1133
 9.18  856
 8.60  334
10.71  642
11.59 2133];
units.LN = {'cm','#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'JohaMcQu1989'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as T(t)=11+9*cos(t*2*pi/365) in C';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01202*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.74*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47SC8'; % Cat of Life
metaData.links.id_ITIS = '163368'; % ITIS
metaData.links.id_EoL = '205245'; % Ency of Life
metaData.links.id_Wiki = 'Notemigonus_crysoleucas'; % Wikipedia
metaData.links.id_ADW = 'Notemigonus_crysoleucas'; % ADW
metaData.links.id_Taxo = '42278'; % Taxonomicon
metaData.links.id_WoRMS = '159989'; % WoRMS
metaData.links.id_fishbase = 'Notemigonus-crysoleucas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notemigonus_crysoleucas}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notemigonus-crysoleucas.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'JohaMcQu1989'; type = 'article'; bib = [ ... 
'author = {Mark R. S. Johannes and Donald J. McQueen and Tom J. Stewart and John R. Post}, ' ...
'year = {1989}, ' ...
'title  = {Golden shiner (\emph{Notemigonus crysoleucas}) population abundance: {C}orrelations with food and predators}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'pages = {810-817}, ' ...
'volume = {46}'];
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


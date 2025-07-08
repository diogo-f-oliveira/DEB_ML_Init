  function [data, auxData, metaData, txtData, weights] = mydata_Chrosomus_tennesseensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chrosomus_tennesseensis'; 
metaData.species_en = 'Tennessee dace'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 17]; 

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'HameAlso2009';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.64;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'HameAlso2009';
  comment.Lp = 'based on tp 1 yr and tL data, giving SL 3.9 cm and F2';
data.Li = 7.2;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'HameAlso2009';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 0.95;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'fishbase','HameAlso2009'};
  comment.Wwp = 'based on 0.00891*Lp^3.06, see F1';
data.Wwi = 3.74;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.06, see F1';


% univariate data
% time-length
data.tL = [ ... % yr class (yr), std length (cm)
    0 2.5
    1 4.3
    2 5.2
    3 5.7];
data.tL(:,1) = 365 * (1 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.84; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HameAlso2009'; 

% length fecundity
data.LN = [ ... % std length (cm), fecundity (#)
4.212	495.915
4.298	464.654
4.315	403.552
4.496	434.813
4.582	541.385
4.599	458.970
4.607	427.709
4.676	611.012
4.702	552.753
4.797	652.220
4.814	638.011
4.814	562.700
4.908	581.172
5.097	569.805
5.115	672.114
5.295	603.908
5.398	719.005
5.622	720.426];
data.LN(:,1) = data.LN(:,1)/ 0.84; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HameAlso2009'; 


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

%% Facts
F1 = 'length-weight Ww in g = 0.00891 * (TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length - length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5YHYB'; % Cat of Life
metaData.links.id_ITIS = '913998'; % ITIS
metaData.links.id_EoL = '212433'; % Ency of Life
metaData.links.id_Wiki = 'Chrosomus_tennesseensis'; % Wikipedia
metaData.links.id_ADW = 'Chrosomus_tennesseensis'; % ADW
metaData.links.id_Taxo = '1682641'; % Taxonomicon
metaData.links.id_WoRMS = '1011811'; % WoRMS
metaData.links.id_fishbase = 'Chrosomus-tennesseensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chrosomus_tennesseensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrosomus-tennesseensis.html}}';  
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
bibkey = 'HameAlso2009'; type = 'article'; bib = [ ...  
'author = {M. Kevin Hamed and Fred J. Alsop and Thomas F. Laughlin}, ' ...
'year = {2009}, ' ...
'title = {Life History Traits of the {T}ennessee Dace (\emph{Phoxinus tennesseensis}) in {N}ortheast {T}ennessee}, ' ... 
'journal = {Am. Midl. Nat.}, ' ...
'volume = {160}, '...
'pages = {289-299}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_radiosum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_radiosum'; 
metaData.species_en = 'Orangebelly darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.tp = 0.6*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'Scal1971';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Scal1971';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.3;  units.Lp = 'cm'; label.Lp = 'standard total at puberty';  bibkey.Lp = 'Scal1971'; 
data.Li = 7.225;  units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 8.5 cm, see F2';

data.Wwb = 1.3e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Scal1971';
  comment.Wwb = 'based on egg diameter of 1.35 mm: pi/6*0.135^3';
data.Wwi = 4.25;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*8.5^3.14, see F1, F2';
 
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0 3.367
1 3.850
2 4.736
3 5.595
4 6.221];
data.tL_f(:,1) = 365 * (0.4 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Scal1971';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0 3.331
1 4.163
2 4.861
3 5.819
4 6.499];
data.tL_m(:,1) = 365 * (0.4 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Scal1971';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % std length (cm), spent ova (#)
    3.5 320
    3.6 318
    3.8 391
    4.0 404
    4.3 481
    4.4 502
    4.7 641
    4.9 663
    5.1 763
    5.2 712
    5.5 928];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
bibkey.LN = 'Scal1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.Li =  5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mean temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = .,85 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);


%% Links
metaData.links.id_CoL = '3BL68'; % Cat of Life
metaData.links.id_ITIS = '168426'; % ITIS
metaData.links.id_EoL = '207811'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_radiosum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_radiosum'; % ADW
metaData.links.id_Taxo = '174141'; % Taxonomicon
metaData.links.id_WoRMS = '1148858'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-radiosum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_radiosum}}';  
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
bibkey = 'Scal1971'; type = 'phdthesis'; bib = [ ... 
'author = {Charles G. Scalet}, ' ...
'year = {1971}, ' ...
'title = {Life History of the Orangebelly Darter \emph{Etheostoma radiosum cyanorum} (Osteichthyes, Percidae}, ' ... 
'school = {Univ. Oklahoma}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-radiosum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

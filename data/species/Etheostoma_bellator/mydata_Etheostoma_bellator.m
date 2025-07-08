  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_bellator
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_bellator'; 
metaData.species_en = 'Warrior darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 04]; 

%% set data
% zero-variate data
data.tp = 1.2*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'KhudKuha2007';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'KhudKuha2007';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Wiki gives 5 yrs';
  
data.Lp = 3.3;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'PageBurr1991'; 
data.Li = 7.2;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'PageBurr1991';

data.Wwb = 5e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KhudKuha2007';
  comment.Wwb = 'based on egg diameter of 0.99 mm: pi/6*0.099^3';
data.Wwi = 4.2;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'fishbase','PageBurr1991'};
  comment.Wwi = 'based on 0.00513*(7.2/0.85)^3.14, see F1, F2';
 
% univariate data
% time - length
data.tL = [ ... % time since birth (yr), std length (cm)
0 3.34
1 4.22
2 4.79
3 5.57];
data.tL(:,1) = 365 * (0 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KhudKuha2007';
comment.tL = 'Sexes combined, but males were larger than females';

% length - fecundity
data.LN = [ ... % std length (cm), oocytes (#)
3.448	45.371
3.496	34.725
3.539	57.271
3.550	64.078
3.624	55.554
3.639	41.084
3.645	33.423
3.672	64.057
3.677	44.907
3.704	54.690
3.704	70.860
3.709	49.582
3.778	56.379
3.779	87.017
3.784	69.995
3.809	26.587
3.809	32.969
3.817	91.266
3.837	70.412
3.869	63.172
3.884	41.467
3.911	33.803
4.076	69.520
4.099	98.452
4.146	70.359
4.172	49.504
4.269	92.891
4.311	96.288
4.316	66.926
4.343	71.177
4.343	100.113
4.428	78.822
4.709	67.284
4.712	166.007
4.732	102.174
4.738	145.152
4.945	111.500
5.031	142.549
5.056	108.927
5.168	121.249];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KhudKuha2007';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are larger than females, but no data to separate sexes';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL2D'; % Cat of Life
metaData.links.id_ITIS = '553377'; % ITIS
metaData.links.id_EoL = '219399'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_bellator'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_bellator'; % ADW
metaData.links.id_Taxo = '690858'; % Taxonomicon
metaData.links.id_WoRMS = '1010988'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-bellator'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_bellator}}';  
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
bibkey = 'KhudKuha2007'; type = 'Article'; bib = [ ... 
'doi = {10.1080/02705060.2007.9665043}, ' ...
'author = {J. Khudamrongsawat and B. R. Kuhajda}, ' ...
'year = {2007}, ' ...
'title = {Life History of the Warrior Darter (\emph{Etheostoma bellator}) and Comparison with the Endangered Vermilion Darter (\emph{Etheostoma chermocki})}, ' ... 
'journal = {Journal of Freshwater Ecology}, ' ...
'volume = {22}, ' ...
'pages = {241-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-bellator.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PageBurr1991'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Page, L. M. and Burr, B. M.}, ' ...
'year = {1991}, ' ...
'title  = {Freshwater fishes}, ' ...
'publisher = {Houghton Mifflin Company, Boston}, ' ...
'series = {Peterson Field Guides}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Tor_putitora
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Tor_putitora'; 
metaData.species_en = 'Putitor mahseer'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 08];

%% set data
% zero-variate data
data.ab = 11;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'JohaNeg2003'; 
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 33;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 183;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'fishbase also gives TL 275 cm';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'JohaNeg2003';
  comment.Wwb = 'Based on egg diameter of 2-2.5 mm: pi/6*0.225^3';
data.Wwp = 335;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^3.00, see F1';
data.Wwi = 57e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.00, see F1';

% univariate data
% time-length
data.tL = [ ... % time (yr), total length (cm)
    1 14.32
    2 19.35
    3 31.50
    4 39.49
    5 45.91
    6 54.41
    7 64.65 
    8 71.07
    9 78.54
   10 83.22
   11 86.69];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JohaNeg2003'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecunsity (#)
41.428	4497.842
44.966	5468.205
46.054	8260.545
49.064	5465.650
49.430	4181.133
49.972	5851.618
51.010	6262.442
52.052	6062.291
54.002	6185.764
54.583	6821.311
54.964	8329.802
57.988	8265.573];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(24.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'JoshDas2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
%weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'TL-weight: weight (in g) = 0.00933*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57FBK'; % Cat of Life
metaData.links.id_ITIS = '690200'; % ITIS
metaData.links.id_EoL = '222241'; % Ency of Life
metaData.links.id_Wiki = 'Tor_putitora'; % Wikipedia
metaData.links.id_ADW = 'Tor_putitora'; % ADW
metaData.links.id_Taxo = '189132'; % Taxonomicon
metaData.links.id_WoRMS = '1026593'; % WoRMS
metaData.links.id_fishbase = 'Tor-putitora'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tor_putitora}}';  
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
bibkey = 'JohaNeg2003'; type = 'article'; bib = [ ...  
'author = {M.S. Johal and R. K. Neg and T. Negi}, ' ...
'year = {2003}, ' ...
'title = {Age and growth of golden mahseer \emph{Tor putitora} from {P}ong {R}eservoir, {H}imachal {P}radesh, {I}ndia}, ' ... 
'journal = {Him. J. Env. Zool.}, ' ...
'volume = {17(1)}, ' ...
'pages = {17-29}, ' ...
'howpublished = {url{https://aquadocs.org/handle/1834/33381}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JohaNeg2003'; type = 'techreport'; bib = [ ...  
'author = {D. Sarma and M. S. Akhtar and S.G.S.Zaidi and Rajesh, M}, ' ...
'year = {2003}, ' ...
'title = {Golden mahseer, \emph{Tor putitora} ({H}amilton, 1822)}, ' ... 
'institution = {ICAR- Directorate of Coldwater Fisheries Research, Bhimtal -263136, Nainital, (Uttarakhand) India}, ' ...
'howpublished = {\url{https://www.dcfr.res.in/download/dcfrtechnologies/Golden_mahseer.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoshDas2018'; type = 'article'; bib = [ ...  
'doi = {10.1080/09712119.2018.1497493}' ...
'author = {Kripal Datt Joshi and Shyamal Chandra Shukla Das and Ravindra Kumar Pathak and Amanullah Khan and Uttam Kumar Sarkar and Koushik Roy}, ' ...
'year = {2018}, ' ...
'title = {Pattern of reproductive biology of the endangered golden mahseer \emph{Tor putitora} ({H}amilton 1822) with special reference to regional climate change implications on breeding phenology from lesser {H}imalayan region, {I}ndia}, ' ... 
'journal = {Journal of Applied Animal Research}, ' ...
'volume = {46(1)}, ' ...
'pages = {1289-1295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tor-putitora}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


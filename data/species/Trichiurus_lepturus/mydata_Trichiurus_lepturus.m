function [data, auxData, metaData, txtData, weights] = mydata_Trichiurus_lepturus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Trichiuridae';
metaData.species    = 'Trichiurus_lepturus'; 
metaData.species_en = 'Largehead hairtail'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 19];

%% set data
% zero-variate data

data.ab = 79/24;   units.ab = 'd';   label.ab = 'age at birth';               bibkey.ab = 'scxuebao';   
  temp.ab = C2K(21.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';  
  temp.am = C2K(15.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'except for ab, all temps are guessed';
  
data.Lp  = 50.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 234;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1 mm: 4/3*pi*.05^3';
data.Wwi = 5000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.Ri  = 130e3/365; units.Ri  = '#/d'; label.Ri  = 'rep rate at 45 cm preanal length'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '45 cm preanal length converts to 175.5 cm TL';
 
% uni-variate data

% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
    0.5 27.3
    1   41.6
    1.5 55.0
    2   69.0
    2.5 79.8
    3   88.5
    3.5 94.5];
data.tL(:,1) = 365 * (.4 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'preanal length'};  
temp.tL    = C2K(15.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Nara1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'depth range 0 to 589 m, most records 100 to 350 m';
metaData.bibkey.F1 = 'Wiki';
F2 = 'length-weight: gutted weight (g) = 5.672e-5 (prenal length im mm)^2.755';
metaData.bibkey.F2 = 'KwokNi2000';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '589FX'; % Cat of Life
metaData.links.id_ITIS = '172385'; % ITIS
metaData.links.id_EoL = '46577378'; % Ency of Life
metaData.links.id_Wiki = 'Trichiurus_lepturus'; % Wikipedia
metaData.links.id_ADW = 'Trichiurus_lepturus'; % ADW
metaData.links.id_Taxo = '46670'; % Taxonomicon
metaData.links.id_WoRMS = '127089'; % WoRMS
metaData.links.id_fishbase = 'Trichiurus-lepturus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trichiurus_lepturus}}';
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
bibkey = 'Nara1976'; type = 'Article'; bib = [ ... 
'author = {K. A. Narasimham}, ' ... 
'year = {1976}, ' ...
'title = {Age and growth of ribbonfish, \emph{Trichiurus trichiurus} {L}innaeus}, ' ...
'journal = {Indian J.  Fish.}, ' ...
'volume = {23}, ' ...
'pages = {174-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KwokNi1999'; type = 'Article'; bib = [ ... 
'author = {K. Y. Kwok and I-H. Ni}, ' ... 
'year = {1999}, ' ...
'title = {Reproduction of cutlassfishes \emph{Trichiurus spp.} from the {S}outh {C}hina {S}ea}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {176}, ' ...
'pages = {39--47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trichiurus-nanhaiensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'scxuebao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.scxuebao.cn/scxuebao/ch/reader/create_pdf.aspx?file_no=20030215&year_id=2003&quarter_id=2&falg=1}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];